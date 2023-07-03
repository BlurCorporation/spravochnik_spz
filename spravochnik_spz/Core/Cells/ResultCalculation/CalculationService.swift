//
//  CalculationService.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 16.05.2023.
//
protocol CalculationServicable {
    func calculate(
        type: СalculationType,
        defaulValueCoefficients: [DefaultCoefficientValueModel],
        valueCoefficients: [ValueСoefficientModel],
        choiceCoefficients: [ChoiceCoefficientModel],
        checkboxCoefficients: [CheckboxСoefficientModel]
    ) -> [CalculationResultModel]
}

final class CalculationService {
    private var defaulValueCoefficients: [DefaultCoefficientValueModel] = []
    private var valueCoefficients: [ValueСoefficientModel] = []
    private var choiceCoefficients: [ChoiceCoefficientModel] = []
    private var checkboxCoefficients: [CheckboxСoefficientModel] = []

}

extension CalculationService: CalculationServicable {
    func calculate(
        type: СalculationType,
        defaulValueCoefficients: [DefaultCoefficientValueModel],
        valueCoefficients: [ValueСoefficientModel],
        choiceCoefficients: [ChoiceCoefficientModel],
        checkboxCoefficients: [CheckboxСoefficientModel]
    ) -> [CalculationResultModel] {
        self.defaulValueCoefficients = defaulValueCoefficients
        self.valueCoefficients = valueCoefficients
        self.choiceCoefficients = choiceCoefficients
        self.checkboxCoefficients = checkboxCoefficients
    
        switch type {
        case .securityAlarm:
            return calculateSecurityAlarm()
        case .perimeterSecurityAlarm:
            return calculatePerimeterSecurityAlarm()
        case .fireAlarmSystem:
            return calculateFireAlarmSystem()
        case .fireWarningSystem:
            return calculateFireWarningSystem()
        case .modularFireExtinguishingSystems:
            return calculateSecurityAlarm()
        case .smokeRemovalControlSystem:
            return calculateSecurityAlarm()
        case .pumpingStationsOfFireExtinguishingInstallations:
            return calculateSecurityAlarm()
        }
    }
}

private extension CalculationService {
    private func calculateSecurityAlarm() -> [CalculationResultModel] {
        //Value - м2
        var price: Double = .zero
        valueCoefficients.forEach { value in
            if value.type == .objectArea {
                switch value.value {
                case 0..<100:
                    price = 540
                case 100..<200:
                    price = 623
                case 200..<400:
                    price = 738
                case 400..<700:
                    price = 875
                case 700..<1_000:
                    price = 1_037
                case 1_000..<2_000:
                    price = 2_074
                case 2_000..<3_000:
                    price = 2_696
                case 3_000..<5_000:
                    price = 3317
                case 5_000..<7_000:
                    price = 3_940
                case 7_000..<10_000:
                    price = 4561
                case 10_000..<13_000:
                    price = 5_184
                case 13_000..<17_000:
                    price = 5_702
                case 17_000..<21_000:
                    price = 6_140
                case 21_000..<25_000:
                    price = 6_530
                default:
                    price = 540
                }
            }
        }
        
        //Choice
        var linesOfDefCoef: Double = .zero
        choiceCoefficients.forEach{ lines in
            if lines.type == .numberOfLinesOfDefence {
                switch lines.itemIndex {
                case 1:
                    linesOfDefCoef = 1
                case 2:
                    linesOfDefCoef = 1.2
                case 3:
                    linesOfDefCoef = 1.3
                default:
                    linesOfDefCoef = 1
                }
            }
        }
        
        //Default
        var inflCoef: Double = 1
        defaulValueCoefficients.forEach { coef in
            if coef.type == .inflationRate {
                inflCoef = coef.type.defaultValue
            }
        }
        
        //Checkbox
        var flag = false
        var specialPurposeCoef: Double = 1
        var outdoorEquipCoef: Double = 1
        var architectCoef: Double = 1
        var importOrNewCoef: Double = 1
        var explosivesZonezCoef: Double = 1
        var highOrLowTempCoef: Double = 1
        var hiddenLayingCoef: Double = 1
        checkboxCoefficients.forEach { checkbox in
            if checkbox.isSelected == true {
                switch checkbox.type {
                case .twoStageDocumentationDevelopment:
                    flag.toggle()
                case .objectOfArchitecturalAndHistoricalValue:
                    architectCoef = 1.3
                case .thePresenceOfHiddenLayingOfEngineeringCommunications:
                    hiddenLayingCoef = 1.2
                case .outdoorEquipmentInstallation:
                    outdoorEquipCoef = 1.1
                case .specialPurposeObject:
                    specialPurposeCoef = 1.4
                case .usingImportedOrNewEquipment:
                    importOrNewCoef = 1.3
                case .presenceOfExplosiveZones:
                    explosivesZonezCoef = 1.3
                case .presenceOfHighOrLowTemperatures:
                    highOrLowTempCoef = 1.2
                default:
                    break
                }
            }
        }
        
        price *= (linesOfDefCoef * inflCoef * specialPurposeCoef * outdoorEquipCoef * architectCoef * importOrNewCoef * explosivesZonezCoef * highOrLowTempCoef * hiddenLayingCoef)
        
        let stageRPrice: Double = price * 0.25
        
        var result: [CalculationResultModel] = [.init(title: .stageP,
                                                      description: "Цена разработки проектной документации:",
                                                      prices: [.init(type: .withVat,
                                                                     value: stageRPrice),
                                                               .init(type: .withoutVat,
                                                                     value: stageRPrice)])]
        
        if flag {
            let stagePPrice: Double = price * 0.75
            let calculationResult = CalculationResultModel(title: .stageR,
                                                           description: "Цена разработки проектной документации:",
                                                           prices: [.init(type: .withVat,
                                                                          value: stagePPrice),
                                                                    .init(type: .withoutVat,
                                                                          value: stagePPrice)])
            result.append(calculationResult)
        }

        return result
    }
    
    private func calculatePerimeterSecurityAlarm() -> [CalculationResultModel] {
        //Value - км
        var price: Double = .zero
        var blockSectionsCoef: Double = 1
        valueCoefficients.forEach { value in
            switch value.type {
            case .lengthOfThePerimeter:
                switch value.value {
                case 0..<0.2:
                    price = 800
                case 0.2..<0.4:
                    price = 1_314
                case 0.4..<0.6:
                    price = 1_724
                case 0.6..<0.8:
                    price = 2_000
                case 0.8..<1:
                    price = 2_206
                case 1..<2:
                    price = 3_556
                case 2..<3:
                    price = 4_636
                case 3..<4:
                    price = 5_518
                case 4..<5:
                    price = 6_400
                case 5..<6:
                    price = 7_234
                case 6..<7:
                    price = 8_068
                case 7..<9:
                    price = 8_852
                case 9..<11:
                    price = 9_636
                case 11..<13:
                    price = 10_374
                case 13..<15:
                    price = 11_108
                default:
                    price = 800
                }
            case .numberOfBlockingSections:
                if value.value > 5 {
                    blockSectionsCoef = 1 + Double(((Int(value.value) + Int(value.value) % 4) / 4) - 1) * 0.15
                } else {
                    blockSectionsCoef = 1
                }
            default:
                break
            }
        }
        
        //Choice
        var linesOfDefCoef: Double = 1
        var terrainCoef: Double = 1
        choiceCoefficients.forEach{ lines in
            switch lines.type {
            case .numberOfLinesOfDefence:
                switch lines.itemIndex {
                case 1:
                    linesOfDefCoef = 1
                case 2:
                    linesOfDefCoef = 1.5
                case 3:
                    linesOfDefCoef = 1.7
                default:
                    linesOfDefCoef = 1
                }
            case .terrain:
                switch lines.itemIndex {
                case 1: // Нормальный
                    terrainCoef = 1
                case 2: // Холмистый
                    terrainCoef = 1.3
                case 3: // Гористый
                    terrainCoef = 1.6
                default:
                    terrainCoef = 1
                }
            default:
                break
            }
        }
        
        //Default
        var inflCoef: Double = 1
        defaulValueCoefficients.forEach { coef in
            if coef.type == .inflationRate {
                inflCoef = coef.type.defaultValue
            }
        }
        
        //Checkbox
        var flag = false
        var specialPurposeCoef: Double = 1
        var architectCoef: Double = 1
        var importOrNewCoef: Double = 1
        var explosivesZonezCoef: Double = 1
        var highOrLowTempCoef: Double = 1
        var lightingCoef: Double = 1
        checkboxCoefficients.forEach { checkbox in
            if checkbox.isSelected == true {
                switch checkbox.type {
                case .twoStageDocumentationDevelopment:
                    flag.toggle()
                case .securityLightingProjectDevelopment:
                    lightingCoef = 1.5
                case .objectOfArchitecturalAndHistoricalValue:
                    architectCoef = 1.3
                case .specialPurposeObject:
                    specialPurposeCoef = 1.4
                case .usingImportedOrNewEquipment:
                    importOrNewCoef = 1.3
                case .presenceOfExplosiveZones:
                    explosivesZonezCoef = 1.3
                case .presenceOfHighOrLowTemperatures:
                    highOrLowTempCoef = 1.2
                default:
                    break
                }
            }
        }
        
        price *= (linesOfDefCoef * inflCoef * specialPurposeCoef * lightingCoef * architectCoef * importOrNewCoef * explosivesZonezCoef * highOrLowTempCoef * blockSectionsCoef * terrainCoef)
        
        let stageRPrice: Double = price * 0.25
        
        var result: [CalculationResultModel] = [.init(title: .stageP,
                                                      description: "Цена разработки проектной документации:",
                                                      prices: [.init(type: .withVat,
                                                                     value: stageRPrice),
                                                               .init(type: .withoutVat,
                                                                     value: stageRPrice)])]
        
        if flag {
            let stagePPrice: Double = price * 0.75
            let calculationResult = CalculationResultModel(title: .stageR,
                                                           description: "Цена разработки проектной документации:",
                                                           prices: [.init(type: .withVat,
                                                                          value: stagePPrice),
                                                                    .init(type: .withoutVat,
                                                                          value: stagePPrice)])
            result.append(calculationResult)
        }

        return result
    }
    
    private func calculateFireAlarmSystem() -> [CalculationResultModel] {
        return []
    }
    
    private func calculateFireWarningSystem() -> [CalculationResultModel] {
        //Value - м2
        var price: Double = .zero
        valueCoefficients.forEach { value in
            switch value.type {
            case .objectArea:
                switch value.value {
                case 0..<100:
                    price = 480
                case 100..<200:
                    price = 554
                case 200..<400:
                    price = 656
                case 400..<700:
                    price = 778
                case 700..<1_000:
                    price = 922
                case 1_000..<2_000:
                    price = 1_843
                case 2_000..<3_000:
                    price = 2_397
                case 3_000..<5_000:
                    price = 2_949
                case 5_000..<7_000:
                    price = 3_502
                case 7_000..<10_000:
                    price = 4_054
                case 10_000..<13_0000:
                    price = 4_608
                case 13_000..<17_000:
                    price = 5_069
                case 17_000..<21_000:
                    price = 5_458
                case 21_000..<25_000:
                    price = 5_805
                default:
                    price = 480
                }
            default:
                break
            }
        }
        
        //Choice
        var notificationTypeCoef: Double = 1
        choiceCoefficients.forEach { lines in
            switch lines.type {
            case .typeOfNotificationSystem:
                switch lines.itemIndex {
                case 1:
                    notificationTypeCoef = 1
                case 2:
                    notificationTypeCoef = 1.2
                case 3:
                    notificationTypeCoef = 1.4
                case 4:
                    notificationTypeCoef = 1.6
                case 5:
                    notificationTypeCoef = 1.8
                default:
                    notificationTypeCoef = 1
                }
            default:
                break
            }
        }
        
        //Default
        var inflCoef: Double = 1
        defaulValueCoefficients.forEach { coef in
            if coef.type == .inflationRate {
                inflCoef = coef.type.defaultValue
            }
        }
        
        //Checkbox
        var flag = false
        var specialPurposeCoef: Double = 1
        var architectCoef: Double = 1
        var importOrNewCoef: Double = 1
        var explosivesZonezCoef: Double = 1
        var highOrLowTempCoef: Double = 1
        var individualEvacuationZonesCoef: Double = 1
        var evacuationProjectCoef: Double = 1
        var hiddenGasketCoef: Double = 1
        var outdoorEquipment: Double = 1
        checkboxCoefficients.forEach { checkbox in
            if checkbox.isSelected == true {
                switch checkbox.type {
                case .twoStageDocumentationDevelopment:
                    flag.toggle()
                case .availabilityOfAlertsForIndividualEvacuationZones:
                    individualEvacuationZonesCoef = 1.3
                case .developmentOfTheEvacuationProject:
                    evacuationProjectCoef = 1.5
                case .thePresenceOfAHiddenGasket:
                    hiddenGasketCoef = 1.2
                case .outdoorEquipmentInstallation:
                    outdoorEquipment = 1.1
                case .objectOfArchitecturalAndHistoricalValue:
                    architectCoef = 1.3
                case .specialPurposeObject:
                    specialPurposeCoef = 1.4
                case .usingImportedOrNewEquipment:
                    importOrNewCoef = 1.3
                case .presenceOfExplosiveZones:
                    explosivesZonezCoef = 1.3
                case .presenceOfHighOrLowTemperatures:
                    highOrLowTempCoef = 1.2
                default:
                    break
                }
            }
        }
        
        
        price *= (notificationTypeCoef * inflCoef * specialPurposeCoef * architectCoef * importOrNewCoef * explosivesZonezCoef * highOrLowTempCoef * individualEvacuationZonesCoef * evacuationProjectCoef * hiddenGasketCoef * outdoorEquipment)
        
        let stageRPrice: Double = price * 0.25
        
        var result: [CalculationResultModel] = [.init(title: .stageP,
                                                      description: "Цена разработки проектной документации:",
                                                      prices: [.init(type: .withVat,
                                                                     value: stageRPrice),
                                                               .init(type: .withoutVat,
                                                                     value: stageRPrice)])]
        
        if flag {
            let stagePPrice: Double = price * 0.75
            let calculationResult = CalculationResultModel(title: .stageR,
                                                           description: "Цена разработки проектной документации:",
                                                           prices: [.init(type: .withVat,
                                                                          value: stagePPrice),
                                                                    .init(type: .withoutVat,
                                                                          value: stagePPrice)])
            result.append(calculationResult)
        }

        return result
    }
    
    private func calculateModularFireExtinguishingSystems() -> [CalculationResultModel] {
        print(#function)
        return []
    }
    
    private func calculateSmokeRemovalControlSystem() -> [CalculationResultModel] {
        print(#function)
        return []
    }
    
    private func calculatePumpingStationsOfFireExtinguishingInstallations() -> [CalculationResultModel] {
        print(#function)
        return []
    }
}
