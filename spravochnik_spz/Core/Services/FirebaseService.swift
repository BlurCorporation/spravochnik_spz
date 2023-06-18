//
//  FirebaseService.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 20.05.2023.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol FirebaseServiceProtocol {
    func setCalculation(userID: String,
                        calcName: String,
                        calcModel: Calculation,
                        completion: @escaping (Result<Bool, Error>) -> Void)
    
    func getCalculation(userID: String,
                        calcName: String,
                        completion: @escaping (Result<Calculation, Error>) -> Void)
    
    func getAllCalculations(userID: String,
                            completion: @escaping (Result<[QueryDocumentSnapshot]?, Error>) -> Void)
    
    func deleteCalculation(userID: String,
                           calcName: String,
                           completion: @escaping (Result<String, Error>) -> Void)
}

final class FirebaseService {
    func configureFB() -> Firestore {
        var database: Firestore
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        database = Firestore.firestore()
        return database
    }
}

extension FirebaseService: FirebaseServiceProtocol {
    func setCalculation(userID: String,
                        calcName: String,
                        calcModel: Calculation,
                        completion: @escaping (Result<Bool, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID).document(calcName)
//        calcRef.setData(calcModel) { error in
//            if let error = error {
//                print("FirebaseService setCalculation: Error writing document: \(error)")
//                completion(.failure(error))
//            } else {
//                print("FirebaseService setCalculation: Document successfully written!")
//                completion(.success(""))
//            }
//        }
        do {
            try calcRef.setData(from: calcModel) { error in
                if let error = error {
                    print("FirebaseService setCalculation: Error writing document: \(error)")
                    completion(.failure(error))
                } else {
                    print("FirebaseService setCalculation: Document successfully written!")
                    completion(.success(true))
                }
            }
        } catch let error {
            print("FirebaseService setCalculation: Error writing to Firestore: \(error)")
            completion(.failure(error))
        }
    }
    
    func getCalculation(userID: String,
                        calcName: String,
                        completion: @escaping (Result<Calculation, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID).document(calcName)
//        calcRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
        calcRef.getDocument(as: Calculation.self) { result in
            switch result {
            case .success(let calc):
                print("CalculationModel: \(calc)")
                completion(.success(calc))
            case .failure(let error):
                print("Error decoding CalculationModel: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    func getAllCalculations(userID: String,
                           completion: @escaping (Result<[QueryDocumentSnapshot]?, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID)
        calcRef.getDocuments() { (querySnapshot, error) in
            guard let querySnapshot = querySnapshot else {
                print("ERROR getAllCalculations querySnapshot")
                completion(.success(nil))
                return
            }
            if let error = error {
                print("Error getting documents: \(error)")
                completion(.failure(error))
            } else {
                completion(.success(querySnapshot.documents))
            }
        }
    }
    
    func deleteCalculation(userID: String,
                           calcName: String,
                           completion: @escaping (Result<String, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID).document(calcName)
        calcRef.delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
                completion(.failure(error))
            } else {
                print("Document successfully removed!")
                completion(.success(""))
            }
        }
    }
}
