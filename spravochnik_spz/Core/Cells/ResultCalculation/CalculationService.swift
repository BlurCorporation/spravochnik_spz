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
        var flag = false
        checkboxCoefficients.forEach {
            if $0.type == .twoStageDocumentationDevelopment && $0.isSelected {
                flag = true
            }
        }
        
        let stageRPrice: Double = 1_000_000
        
        var result: [CalculationResultModel] = [.init(title: .stageP,
                                                      description: "description",
                                                      prices: [.init(type: .withVat, value: 123123123),
                                                               .init(type: .withoutVat, value: 321321321)],]
        
        if flag {
            let stagePPrice: Double = 1_050_000
            let calculationResult = CalculationResultModel(
                title: .stageP,
                description: "description",
                prices: (withoutVat: .init(type: .withoutVat, value: stagePPrice),
                         withVat: .init(type: .withVat, value: stageRPrice))
            )
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
