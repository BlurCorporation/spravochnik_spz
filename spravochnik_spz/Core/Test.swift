//
//  Test.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 25.02.2023.
//

import Foundation

// MARK: - 1
enum ValueСoefficientType {
    case objectArea
    case lengthOfThePerimeter
    case numberOfBlockingSections
    case numberOfProtectedPremises
    
    var title: String {
        switch self {
        case .objectArea:
            return "Площадь объекта"
        case .lengthOfThePerimeter:
            return "Протяженность периметра объекта"
        case .numberOfBlockingSections:
            return "Количество участков блокировки"
        case .numberOfProtectedPremises:
            return "Количество защищаемых помещений (направлений)"
        }
    }
    
    var descrp: String {
        switch self {
        case .objectArea:
            return "м²"
        case .lengthOfThePerimeter:
            return "км"
        case .numberOfBlockingSections:
            return "шт"
        case .numberOfProtectedPremises:
            return "шт"
        }
    }
}

struct ValueСoefficientModel {
    let type: ValueСoefficientType
    var value: Double
    
    init(type: ValueСoefficientType, value: Double = 0.0) {
        self.type = type
        self.value = value
    }
}

struct ValueСoefficientViewModel {
    let title: String
    let value: Double
    let descrpt: String
}

// MARK: - 2
enum ChoiceСoefficientType {
    case numberOfLinesOfDefence
    case terrain
    case typeOfNotificationSystem
    case numberOfFirePumpGroups
    
    var title: String {
        switch self {
        case .numberOfLinesOfDefence:
            return "Количество рубежей защиты"
        case .terrain:
            return "Рельеф местности"
        case .typeOfNotificationSystem:
            return "Тип системы оповещения"
        case .numberOfFirePumpGroups:
            return "Кол-во групп пожарных насосов, дозаторов или устройств введения пенообразующих веществ"
        }
    }
    
    var items: [ChoiceСoefficientItemsModel] {
        switch self {
        case .numberOfLinesOfDefence:
            return []
        case .terrain:
            return []
        case .typeOfNotificationSystem:
            return []
        case .numberOfFirePumpGroups:
            return []
        }
    }
}

struct ChoiceСoefficientItemsModel {
    let title: String
    let value: Double
}

struct ChoiceCoefficientModel {
    let type: ChoiceСoefficientType
    var itemIndex: Int
}

struct ChoiceCoefficientViewModel {
    let title: String
}

// MARK: - 3
enum DefaultValue {}

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
    
    init(type: CheckboxСoefficientType, isSelected: Bool = false) {
        self.type = type
        self.isSelected = isSelected
    }
}

struct CheckboxСoefficientViewModel {
    let title: String
    let isSelected: Bool
}

enum СalculationType: CaseIterable {
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
            return "Насосные станции установок пожаротушения"
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
                .init(type: .numberOfLinesOfDefence, itemIndex: 0)
            ]
        case .perimeterSecurityAlarm:
            return [
                .init(type: .numberOfLinesOfDefence, itemIndex: 0),
                .init(type: .terrain, itemIndex: 0)
            ]
        case .fireAlarmSystem:
            return []
        case .fireWarningSystem:
            return [
                .init(type: .typeOfNotificationSystem, itemIndex: 0)
            ]
        case .modularFireExtinguishingSystems:
            return []
        case .smokeRemovalControlSystem:
            return []
        case .pumpingStationsOfFireExtinguishingInstallations:
            return [
                .init(type: .numberOfFirePumpGroups, itemIndex: 0)
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


