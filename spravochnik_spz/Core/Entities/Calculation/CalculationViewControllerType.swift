//
//  CalculationViewControllerType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum СalculationType: CaseIterable, Codable {
    case securityAlarm
    case perimeterSecurityAlarm
    case fireAlarmSystem
    case fireWarningSystem
    case modularFireExtinguishingSystems
    case smokeRemovalControlSystem
    case pumpingStationsOfFireExtinguishingInstallations
    
    var title: String {
        switch self {
        case .securityAlarm:
            return "Охранная сигнализация"
        case .perimeterSecurityAlarm:
            return "Охранная сигнализация периметра"
        case .fireAlarmSystem:
            return "Пожарная сигнализация"
        case .fireWarningSystem:
            return "Система оповещения о пожаре"
        case .modularFireExtinguishingSystems:
            return "Модульные установки пожаротушения"
        case .smokeRemovalControlSystem:
            return "Система управления дымоудаления"
        case .pumpingStationsOfFireExtinguishingInstallations:
            return "Насосные станции установок ПТ"
        }
    }
    
    var defaultValueCoefficients: [DefaultCoefficientValueModel] {
        switch self {
        case .securityAlarm:
            return [
                .init(type: .inflationRate)
            ]
        case .perimeterSecurityAlarm:
            return [
                .init(type: .inflationRate)
            ]
        case .fireAlarmSystem:
            return [
                .init(type: .inflationRate)
            ]
        case .fireWarningSystem:
            return [
                .init(type: .inflationRate)
            ]
        case .modularFireExtinguishingSystems:
            return [
                .init(type: .inflationRate)
            ]
        case .smokeRemovalControlSystem:
            return [
                .init(type: .inflationRate)
            ]
        case .pumpingStationsOfFireExtinguishingInstallations:
            return [
                .init(type: .inflationRate)
            ]
        }
    }
    
    var valueCoefficients: [ValueСoefficientModel] {
        switch self {
        case .securityAlarm:
            return [
                .init(type: .objectArea)
            ]
        case .perimeterSecurityAlarm:
            return [
                .init(type: .lengthOfThePerimeter),
                .init(type: .numberOfBlockingSections)
            ]
        case .fireAlarmSystem:
            return [
                .init(type: .objectArea)
            ]
        case .fireWarningSystem:
            return [
                .init(type: .objectArea)
            ]
        case .modularFireExtinguishingSystems:
            return [
                .init(type: .numberOfProtectedPremises)
            ]
        case .smokeRemovalControlSystem:
            return [
                .init(type: .objectArea)
            ]
        case .pumpingStationsOfFireExtinguishingInstallations:
            return []
        }
    }
    
    var choiceCoefficients: [ChoiceCoefficientModel] {
        switch self {
        case .securityAlarm:
            return [
                .init(type: .numberOfLinesOfDefence,
                      itemIndex: nil)
            ]
        case .perimeterSecurityAlarm:
            return [
                .init(type: .numberOfLinesOfDefence,
                      itemIndex: nil),
                .init(type: .terrain,
                      itemIndex: nil)
            ]
        case .fireAlarmSystem:
            return []
        case .fireWarningSystem:
            return [
                .init(type: .typeOfNotificationSystem,
                      itemIndex: nil)
            ]
        case .modularFireExtinguishingSystems:
            return []
        case .smokeRemovalControlSystem:
            return []
        case .pumpingStationsOfFireExtinguishingInstallations:
            return [
                .init(type: .numberOfFirePumpGroups,
                      itemIndex: nil)
            ]
        }
    }
    
    var checkboxCoefficients: [CheckboxСoefficientModel] {
        switch self {
        case .securityAlarm:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .thePresenceOfHiddenLayingOfEngineeringCommunications),
                .init(type: .outdoorEquipmentInstallation),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfExplosiveZones),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        case .perimeterSecurityAlarm:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .securityLightingProjectDevelopment),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfExplosiveZones),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        case .fireAlarmSystem:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .availabilityOfAutomaticFireDetectors),
                .init(type: .availabilityOfManualFireDetectors),
                .init(type: .presenceOfACommandPulse),
                .init(type: .availabilityOfOpticalLinearDetectors),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .thePresenceOfAHiddenGasket),
                .init(type: .outdoorEquipmentInstallation),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfExplosiveZones),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        case .fireWarningSystem:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .availabilityOfAlertsForIndividualEvacuationZones),
                .init(type: .developmentOfTheEvacuationProject),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .thePresenceOfAHiddenGasket),
                .init(type: .outdoorEquipmentInstallation),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfExplosiveZones),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        case .modularFireExtinguishingSystems:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .fireExtinguishingStageForMultipleInstallations),
                .init(type: .availabilityOfProtectedPremisesWithAVolumeOfMoreThanOneThousand),
                .init(type: .projectedInstallationManualInstallationOfGasPT),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .thePresenceOfAHiddenGasket),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfExplosiveZones),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        case .smokeRemovalControlSystem:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .manualTypeOfControlOfSmokeRemovalInstallations),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .thePresenceOfAHiddenGasket),
                .init(type: .outdoorEquipmentInstallation),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfExplosiveZones),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        case .pumpingStationsOfFireExtinguishingInstallations:
            return [
                .init(type: .twoStageDocumentationDevelopment),
                .init(type: .motorsWithAVoltageOfMoreThaFourHundred),
                .init(type: .availabilityOfMoreThanTwoPumpsInEachGroup),
                .init(type: .pumpingInternalCombustionEngines),
                .init(type: .designOfPneumaticStations),
                .init(type: .objectOfArchitecturalAndHistoricalValue),
                .init(type: .specialPurposeObject),
                .init(type: .usingImportedOrNewEquipment),
                .init(type: .presenceOfHighOrLowTemperatures)
            ]
        }
    }
}
