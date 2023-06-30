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
        var price: Double = 0
        guard let value = valueCoefficients.first?.value else { fatalError() } 
        switch value {
        case 0..<100:
            price = SecurityAlarmCoef.under100.rawValue
        case 100..<200:
            price = SecurityAlarmCoef.under200.rawValue
        default:
            break
        }
        
        //Checkbox
        var flag = false
        checkboxCoefficients.forEach {
            if $0.type == .twoStageDocumentationDevelopment && $0.isSelected {
                flag = true
            }
        }
        
        let stageRPrice: Double = 1_000_000
        
        var result: [CalculationResultModel] = [.init(title: .stageP,
                                                      description: "Цена разработки проектной документации:",
                                                      prices: [.init(type: .withVat,
                                                                     value: stageRPrice),
                                                               .init(type: .withoutVat,
                                                                     value: stageRPrice)])]
        
        if flag {
            let stagePPrice: Double = 1_050_000
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


enum SecurityAlarmCoef: Double {
    case under100 = 540
    case under200 = 623
    case under400 = 738
    case under700 = 875
    case under1000 = 1037
    case under2000 = 2074
    case under3000 = 2696
    case under5000 = 3317
    case under7000 = 3940
    case under10000 = 4561
    case under13000 = 5184
    case under17000 = 5702
    case under21000 = 6140
    case under25000 = 6530
}
