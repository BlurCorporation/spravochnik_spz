//
//  PDFService.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 29.09.2023.
//

import Foundation
import PDFKit

enum stringsPlaces {
    case alarmSystem1
    case alarmSystem2
    case perimetrAlarm1
    case perimetrAlarm2
    case notification1
    case notification2
    case fireAlarm1
    case fireAlarm2
    case smokeExhaust1
    case smokeExhaust2
    case moduleFirefighting1
    case moduleFirefighting2
    case firePump1
    case firePump2
    
    var coordsForCoefs: [(x: Int, y: Int)] {
        switch self {
        case .alarmSystem1, .alarmSystem2:
            return [(164, 127), (238, 150), (208, 173), (386, 204), (386, 236), (386, 273), (386, 310), (386, 342), (386, 377), (386, 412), (386, 447)]
        case .perimetrAlarm1, .perimetrAlarm2:
            return [(281, 127), (238, 150), (268, 173), (169, 196), (208, 219), (386, 250), (386, 282), (386, 346), (386, 381), (386, 416), (386, 377), (386, 451)]
        case .notification1, .notification2:
            return [(164, 127), (214, 150), (208, 173), (386, 213), (386, 245), (386, 277), (386, 312), (386, 347), (386, 382), (386, 417), (386, 449), (386, 484)]
        case .fireAlarm1, .fireAlarm2:
            return [(164, 127), (208, 150), (208, 173), (386, 204), (386, 241), (386, 278), (386, 310), (386, 345), (386, 380), (386, 412), (386, 447)]
        case .smokeExhaust1, .smokeExhaust2:
            return [(164, 127), (208, 150), (386, 181), (386, 213), (386, 245), (386, 280), (386, 315), (386, 347), (386, 382), (386, 417), (386, 452)]
        case .moduleFirefighting1, .moduleFirefighting2:
            return [(390, 127), (208, 150), (386, 181), (386, 213), (386, 248), (386, 286), (386, 321), (386, 356), (386, 391), (386, 426), (386, 461), (386, 496)]
        case .firePump1, .firePump2:
            return [(440, 134), (208, 165), (386, 196), (386, 228), (386, 263), (386, 298), (386, 333), (386, 368), (386, 400), (386, 435), (386, 473)]
        }
    }
    
    var coordsForPrice: [(x: Int, y: Int)] {
        switch self {
        case .alarmSystem1:
            return [(271, 564), (271, 587)]
        case .alarmSystem2:
            return [(271, 564), (271, 587), (271, 662), (271, 685)]
        case .perimetrAlarm1:
            return [(271, 568), (271, 591)]
        case .perimetrAlarm2:
            return [(271, 568), (271, 591), (271, 666), (271, 689)]
        case .notification1:
            return [(271, 634), (271, 657)]
        case .notification2:
            return [(271, 634), (271, 657), (271, 482), (271, 517)]
        case .fireAlarm1:
            return [(271, 671), (271, 694)]
        case .fireAlarm2:
            return [(271, 671), (271, 694), (271, 769), (271, 792)]
        case .smokeExhaust1:
            return [(271, 569), (271, 592)]
        case .smokeExhaust2:
            return [(271, 569), (271, 592), (271, 667), (271, 690)]
        case .moduleFirefighting1:
            return [(271, 613), (271, 636)]
        case .moduleFirefighting2:
            return [(271, 613), (271, 636), (271, 711), (271, 734)]
        case .firePump1:
            return [(271, 590), (271, 613)]
        case .firePump2:
            return [(271, 590), (271, 613), (271, 688), (271, 711)]
        }
    }
}

protocol PDFServiceProtocol {
    func generatePDF(from text: [Calculation]) -> URL?
}

final class PDFService {
    private func makeDataSourceFromCalculation(_ array: [Calculation]) -> [[String?]] {
        var dataSource: [[String?]] = [[],[]]
        
        array.compactMap { item in
            item.valueCoef.compactMap { value in
                dataSource[0].append("\(value.value) \(value.type.descrp)")
            }
        }
        
        
        
        array.compactMap { item in
            item.choiceCoef.compactMap { value in
                dataSource[0].append("\(value.type.items[value.itemIndex ?? 0]) \(value.type.descrp)")
            }
        }
        
        array.compactMap { item in
            if let value = item.defaultCoef.first?.value {
                let coef = String(value)
                dataSource[0].append(coef)
            } else {
                let coef = String(item.defaultCoef.first?.type.defaultValue ?? 0.0)
                dataSource[0].append(coef)
            }
            
        }
        
        array.compactMap { item in
            item.checkboxСoef.compactMap { value in
                if value.isSelected {
                    dataSource[0].append("checkboxTrue")
                } else {
                    dataSource[0].append(nil)
                }
            }
        }
        
        array.compactMap { item in
            item.calculationResult.compactMap { value in
                for i in value.prices {
                    let price = "\(i.value.formattedWithSeparator) \(i.type.carrency.title)"
                    dataSource[1].append(price)
                }
            }
        }
        
        return dataSource
    }
}

extension PDFService: PDFServiceProtocol {
    func generatePDF(from text: [Calculation]) -> URL? {
        var type: stringsPlaces = .alarmSystem1
        let dataSource = makeDataSourceFromCalculation(text)
        var name = ""
        
        
        switch text.first?.calculationType {
        case .fireAlarmSystem:
            switch text.first?.calculationResult.count {
            case 1:
                name = "fireAlarm1"
                type = .fireAlarm1
            case 2:
                name = "fireAlarm2"
                type = .fireAlarm2
            default:
                name = "error"
            }
        case .securityAlarm:
            switch text.first?.calculationResult.count {
            case 1:
                name = "alarmSystem1"
                type = .alarmSystem1
            case 2:
                name = "alarmSystem2"
                type = .alarmSystem2
            default:
                name = "error"
            }
        case .perimeterSecurityAlarm:
            switch text.first?.calculationResult.count {
            case 1:
                name = "perimetrAlarm1"
                type = .perimetrAlarm1
            case 2:
                name = "perimetrAlarm2"
                type = .perimetrAlarm2
            default:
                name = "error"
            }
        case .fireWarningSystem:
            switch text.first?.calculationResult.count {
            case 1:
                name = "notification1"
                type = .notification1
            case 2:
                name = "notification2"
                type = .notification2
            default:
                name = "error"
            }
        case .modularFireExtinguishingSystems:
            switch text.first?.calculationResult.count {
            case 1:
                name = "moduleFireFighting1"
                type = .moduleFirefighting1
            case 2:
                name = "moduleFireFighting2"
                type = .moduleFirefighting2
            default:
                name = "error"
            }
        case .smokeRemovalControlSystem:
            switch text.first?.calculationResult.count {
            case 1:
                name = "smokeExhaust1"
                type = .smokeExhaust1
            case 2:
                name = "smokeExhaust2"
                type = .smokeExhaust2
            default:
                name = "error"
            }
        case .pumpingStationsOfFireExtinguishingInstallations:
            switch text.first?.calculationResult.count {
            case 1:
                name = "firePump1"
                type = .firePump1
            case 2:
                name = "firePump2"
                type = .firePump2
            default:
                name = "error"
            }
        case .none:
            //TODO: Сделать заглушку когда-нибудь
            name = "error"
        }
        
        let path = Bundle.main.path(forResource: name,  ofType:"pdf")
        
        let fileURL = URL(fileURLWithPath: path!)
        let pdfDocument = PDFDocument(url: fileURL)
        guard let pdfDocument = pdfDocument else { return nil }
        do {
            let pdfMetaData = [kCGPDFContextCreator: "SpravochnikSPZ",
                                kCGPDFContextAuthor: "Blur Corporation"]
            
            let format = UIGraphicsPDFRendererFormat()
            format.documentInfo = pdfMetaData as [String: Any]
            
            let page: PDFPage = pdfDocument.page(at: 0)!
            var mediaBox: CGRect = page.bounds(for: .bleedBox)
            
            let tempDirectory = FileManager.default.temporaryDirectory
            let name = text.first?.navigationBarTitle ?? "Расчет"
            let pdfURL = tempDirectory.appendingPathComponent("\(name).pdf")
            
            let context = CGContext(pdfURL as CFURL, mediaBox: &mediaBox, nil)
            
            UIGraphicsPushContext(context!)
            context!.beginPDFPage(nil)
            
            page.draw(with: .mediaBox, to: context!)
            
            let flipVertical: CGAffineTransform = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: mediaBox.size.height)
            context!.concatenate(flipVertical)

            let attributesRoman = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeueCyr-Roman", size: 14)]
            let attributesMedium = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeueCyr-Medium", size: 16)]
            
            for (index, item) in dataSource[0].enumerated() {
                if item == "checkboxTrue" {
                    let checkboxImage = UIImage(named: "checkboxTrue") ?? UIImage()
                    checkboxImage.draw(at: CGPoint(x: type.coordsForCoefs[index].x, y: type.coordsForCoefs[index].y))
                } else if item != nil {
                    item?.draw(at: CGPoint(x: type.coordsForCoefs[index].x, y: type.coordsForCoefs[index].y), withAttributes: attributesRoman)
                }
            }
            
            for (index, item) in dataSource[1].enumerated() {
                guard let _item = item else { return nil}
                let additionalCoordX = (_item.count - 13) * 9
                item?.draw(at: CGPoint(x: type.coordsForPrice[index].x + additionalCoordX, y: type.coordsForPrice[index].y), withAttributes: attributesMedium)
                
            }
            
            context!.endPDFPage()
            context?.closePDF()

            UIGraphicsPopContext()
            
            return pdfURL
        }
    }
}
