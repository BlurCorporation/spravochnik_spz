//
//  FirebaseRepository.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 21.05.2023.
//

import Foundation

protocol FirebaseRepositoryProtocol {
    func setCalculation(calcModel: CalculationModel,
                        completion: @escaping (Result<Bool, Error>) -> Void)
    func getCalculation(userID: String,
                        calcName: String,
                        completion: @escaping (Result<Calculation, Error>) -> Void)
    func getAllCalculations(userID: String,
                            completion: @escaping (Result<[Calculation]?, Error>) -> Void)
    func deleteCalculation(userID: String,
                           calcName: String,
                           completion: @escaping (Result<String, Error>) -> Void)
}

class FirebaseRepository: FirebaseRepositoryProtocol {
    var calcModel: Calculation?
    let firebaseService: FirebaseServiceProtocol
    
    init(calcModel: Calculation? = nil,
         firebaseService: FirebaseServiceProtocol) {
        self.calcModel = calcModel
        self.firebaseService = firebaseService
    }
    
    func setCalculation(calcModel: CalculationModel,
                        completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let model = calcModel.calculation.first else {
            print("ERROR setCalculation guard let model")
            return
        }
        firebaseService.setCalculation(userID: calcModel.userID,
                                       calcName: calcModel.calcName,
                                       calcModel: model, completion: { result in
            switch result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func getCalculation(userID: String,
                        calcName: String,
                        completion: @escaping (Result<Calculation, Error>) -> Void) {
        firebaseService.getCalculation(userID: userID,
                                       calcName: calcName) { result in
            switch result {
            case .success(let calc):
                completion(.success(calc))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAllCalculations(userID: String,
                            completion: @escaping (Result<[Calculation]?, Error>) -> Void) {
        firebaseService.getAllCalculations(userID: userID) { result in
            switch result {
            case .success(let calc):
                guard let calc = calc else {
                    completion(.success(nil))
                    return
                }
                var allCalcModel: [Calculation] = []
                for element in calc {
                    allCalcModel.append(self.oneCalculation(from: element.data()))
                }
                completion(.success(allCalcModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func oneCalculation(from calcDict: [String: Any]) -> Calculation {
        let decoder = JSONDecoder()
        var model = Calculation(valueCoef: [ValueСoefficientResultModel(title: "",
                                                                        description: "",
                                                                        value: 0)],
                                choiceCoef: [ChoiceCoefficientResultModel(title: "",
                                                                          description: "",
                                                                          value: 0)],
                                defaultCoef: [DefaultCoefficientValueResultModel(title: "",
                                                                                 value: 0)],
                                checkboxСoef: [CheckboxСoefficientResultModel(title: "",
                                                                              value: 0)],
                                calculationResult: [CalculationResultModel(title: TitleType.stageR,
                                                                           description: "",
                                                                           prices: [PriceModel(type: PriceType.withoutVat,
                                                                                               value: 0)])])
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: calcDict,
                                                      options: JSONSerialization.WritingOptions.prettyPrinted)
            model = try decoder.decode(Calculation.self,
                                         from: jsonData)
        } catch {
            print("Error", error)
        }
        return model
    }
    
    func deleteCalculation(userID: String,
                           calcName: String,
                           completion: @escaping (Result<String, Error>) -> Void) {
        
    }
}
