//
//  CheckboxСoefficientType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum CheckboxСoefficientType {
    case twoStageDocumentationDevelopment
    case objectOfArchitecturalAndHistoricalValue
    case thePresenceOfHiddenLayingOfEngineeringCommunications
    case outdoorEquipmentInstallation
    case specialPurposeObject
    case usingImportedOrNewEquipment
    case presenceOfExplosiveZones
    case presenceOfHighOrLowTemperatures
    case availabilityOfAutomaticFireDetectors
    case availabilityOfManualFireDetectors
    case presenceOfACommandPulse
    case availabilityOfOpticalLinearDetectors
    case thePresenceOfAHiddenGasket
    case securityLightingProjectDevelopment
    case availabilityOfAlertsForIndividualEvacuationZones
    case developmentOfTheEvacuationProject
    case fireExtinguishingStageForMultipleInstallations
    case availabilityOfProtectedPremisesWithAVolumeOfMoreThanOneThousand
    case projectedInstallationManualInstallationOfGasPT
    case manualTypeOfControlOfSmokeRemovalInstallations
    case motorsWithAVoltageOfMoreThaFourHundred
    case availabilityOfMoreThanTwoPumpsInEachGroup
    case pumpingInternalCombustionEngines
    case designOfPneumaticStations
    
    var title: String {
        switch self {
        case .twoStageDocumentationDevelopment:
            return "Двухстадийная разработка документации"
        case .objectOfArchitecturalAndHistoricalValue:
            return "Объект архитектурно-исторической ценности"
        case .thePresenceOfHiddenLayingOfEngineeringCommunications:
            return "Наличие скрытой прокладки инженерных коммуникаций"
        case .outdoorEquipmentInstallation:
            return "Уличная установка оборудования"
        case .specialPurposeObject:
            return "Объект специального назначения"
        case .usingImportedOrNewEquipment:
            return "Использование импортного или нового оборудования"
        case .presenceOfExplosiveZones:
            return "Наличие взрывоопасных зон"
        case .presenceOfHighOrLowTemperatures:
            return "Наличие высоких (более 60°С) или низких (менее 45°С) рабочих температур"
        case .availabilityOfAutomaticFireDetectors:
            return "Наличие автоматических пожарных извещателей"
        case .availabilityOfManualFireDetectors:
            return "Наличие ручных пожарных извещателей"
        case .presenceOfACommandPulse:
            return "Наличие командного импульса"
        case .availabilityOfOpticalLinearDetectors:
            return "Наличие оптических линейных/световых извещателей"
        case .thePresenceOfAHiddenGasket:
            return "Наличие скрытой прокладки инженерных коммуникаций"
        case .securityLightingProjectDevelopment:
            return "Разработка проекта охранного освещения"
        case .availabilityOfAlertsForIndividualEvacuationZones:
            return "Наличие оповещения по отдельным зонам эвакуации"
        case .developmentOfTheEvacuationProject:
            return "Разработка проекта эвакуации людей"
        case .fireExtinguishingStageForMultipleInstallations:
            return "Станция пожаротушения для нескольких установок"
        case .availabilityOfProtectedPremisesWithAVolumeOfMoreThanOneThousand:
            return "Наличие защищаемых помещений с объемом более 1000 м³"
        case .projectedInstallationManualInstallationOfGasPT:
            return "Проектируемая установка - ручная установка газового ПТ"
        case .manualTypeOfControlOfSmokeRemovalInstallations:
            return "Ручной тип управления установками дымоудаления"
        case .motorsWithAVoltageOfMoreThaFourHundred:
            return "Двигатели с напряжением более 400В"
        case .availabilityOfMoreThanTwoPumpsInEachGroup:
            return "Наличие в каждой группе более 2 насосов (включая резервные)"
        case .pumpingInternalCombustionEngines:
            return "Насосные двигатели внутреннего сгорания"
        case .designOfPneumaticStations:
            return "Проектирование пневматических станций, станций для хранения и подачи ОТВ"
        }
    }
    
    var value: Double {
        switch self {
        case .twoStageDocumentationDevelopment:
            return 0.5
        case .objectOfArchitecturalAndHistoricalValue:
            return 1.0
        case .thePresenceOfHiddenLayingOfEngineeringCommunications:
            return 1.2
        case .outdoorEquipmentInstallation:
            return 1
        case .specialPurposeObject:
            return 1
        case .usingImportedOrNewEquipment:
            return 1
        case .presenceOfExplosiveZones:
            return 1
        case .presenceOfHighOrLowTemperatures:
            return 1
        case .availabilityOfAutomaticFireDetectors:
            return 1
        case .availabilityOfManualFireDetectors:
            return 1
        case .presenceOfACommandPulse:
            return 1
        case .availabilityOfOpticalLinearDetectors:
            return 1
        case .thePresenceOfAHiddenGasket:
            return 1
        case .securityLightingProjectDevelopment:
            return 1
        case .availabilityOfAlertsForIndividualEvacuationZones:
            return 1
        case .developmentOfTheEvacuationProject:
            return 1
        case .fireExtinguishingStageForMultipleInstallations:
            return 1
        case .availabilityOfProtectedPremisesWithAVolumeOfMoreThanOneThousand:
            return 1
        case .projectedInstallationManualInstallationOfGasPT:
            return 1
        case .manualTypeOfControlOfSmokeRemovalInstallations:
            return 1
        case .motorsWithAVoltageOfMoreThaFourHundred:
            return 1
        case .availabilityOfMoreThanTwoPumpsInEachGroup:
            return 1
        case .pumpingInternalCombustionEngines:
            return 1
        case .designOfPneumaticStations:
            return 1
        }
    }
}

struct CheckboxСoefficientModel {
    let type: CheckboxСoefficientType
    var isSelected: Bool
    
    init(type: CheckboxСoefficientType,
         isSelected: Bool = false) {
        self.type = type
        self.isSelected = isSelected
    }
}

struct CheckboxСoefficientViewModel {
    let title: String
    let isSelected: Bool
}
