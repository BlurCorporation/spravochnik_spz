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
            return calculateSecurityAlarm()
        case .fireAlarmSystem:
            return calculateSecurityAlarm()
        case .fireWarningSystem:
            return calculateSecurityAlarm()
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
        var inflCoef: Double = .zero
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
                    outdoorEquipCoef = 1.2
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
                                                           prices: [.init(type: .withVat, value: stagePPrice),
                                                                    .init(type: .withoutVat, value: stagePPrice)])
            result.append(calculationResult)
        }

        return result
    }
    
    private func calculatePerimeterSecurityAlarm() -> [CalculationResultModel] {
        print(#function)
        return []
    }
    
    private func calculateFireAlarmSystem() -> [CalculationResultModel] {
        print(#function)
        return []
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
