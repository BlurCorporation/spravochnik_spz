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
                        calcDictionary: CalculationModel,
                        completion: @escaping (Result<String, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID).document(calcName)
//        calcRef.setData(calcDictionary) { error in
//            if let error = error {
//                print("FirebaseService setCalculation: Error writing document: \(error)")
//                completion(.failure(error))
//            } else {
//                print("FirebaseService setCalculation: Document successfully written!")
//                completion(.success(""))
//            }
//        }
        do {
            try calcRef.setData(from: calcDictionary) { error in
                if let error = error {
                    print("FirebaseService setCalculation: Error writing document: \(error)")
                    completion(.failure(error))
                } else {
                    print("FirebaseService setCalculation: Document successfully written!")
                    completion(.success(""))
                }
            }
        } catch let error {
            print("FirebaseService setCalculation: Error writing to Firestore: \(error)")
            completion(.failure(error))
        }
    }
    
    func updateCalculation(userID: String,
                           calcName: String,
                           calcDictionary: [String: Any],
                           completion: @escaping (Result<String, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID).document(calcName)
        calcRef.updateData(calcDictionary) { error in
            if let error = error {
                print("FirebaseService updateCalculation: Error updating document: \(error)")
                completion(.failure(error))
            } else {
                print("FirebaseService updateCalculation: Document successfully updated")
                completion(.success(""))
            }
        }
    }
    
    func getCalculation(userID: String,
                        calcName: String,
                        completion: @escaping (Result<CalculationModel, Error>) -> Void) {
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
        calcRef.getDocument(as: CalculationModel.self) { result in
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
    
    func getAllCalculation(userID: String,
                           completion: @escaping (Result<[QueryDocumentSnapshot]?, Error>) -> Void) {
        let db = configureFB()
        let calcRef = db.collection(userID)
        calcRef.getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion(.failure(error))
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
                completion(.success(querySnapshot!.documents))
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
