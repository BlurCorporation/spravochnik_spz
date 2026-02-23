//
//  PDFService.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 29.09.2023.
//

import Foundation
import UIKit

protocol PDFServiceProtocol {
    func generatePDF(from text: [Calculation]) -> URL?
}

final class PDFService: PDFServiceProtocol {
    private let pageRect = CGRect(x: 0, y: 0, width: 595, height: 842) // A4
    private let left: CGFloat = 26
    private let right: CGFloat = 569

    func generatePDF(from text: [Calculation]) -> URL? {
        guard let calculation = text.first else { return nil }

        let fileName = safeFileName(from: calculation.navigationBarTitle)
        let outputURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(fileName).pdf")

        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = [
            kCGPDFContextCreator as String: "SpravochnikSPZ",
            kCGPDFContextAuthor as String: "Blur Corporation",
            kCGPDFContextTitle as String: calculation.navigationBarTitle
        ]

        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)

        do {
            try renderer.writePDF(to: outputURL) { context in
                context.beginPage()
                drawForm(calculation: calculation, context: context.cgContext)
            }
            return outputURL
        } catch {
            return nil
        }
    }

    private func drawForm(calculation: Calculation, context: CGContext) {
        context.setStrokeColor(UIColor.black.cgColor)
        context.setFillColor(UIColor.black.cgColor)

        // MARK: Header
        drawText("Приложение к договору №", x: left, y: 58, width: 200, size: 6, context: context)
        drawText("от", x: 128, y: 58, width: 20, size: 6, context: context)
        drawLine(from: CGPoint(x: 145, y: 65), to: CGPoint(x: 195, y: 65), lineWidth: 0.6, context: context)
        drawText(currentYear(), x: 197, y: 58, width: 34, size: 6, context: context)
        drawText("г.", x: 232, y: 58, width: 10, size: 6, context: context)

        drawText("Форма 2п", x: right - 45, y: 58, width: 45, size: 6, alignment: .right, context: context)
        drawLine(from: CGPoint(x: 220, y: 65), to: CGPoint(x: right, y: 65), lineWidth: 0.6, context: context)
        drawText("(договору, дополнительному соглашению)", x: 330, y: 67, width: 160, size: 4.5, alignment: .center, context: context)

        drawText("СОГЛАСОВАНО:", x: left, y: 80, width: 120, size: 8, font: .boldSystemFont(ofSize: 8), context: context)
        drawText("УТВЕРЖДАЮ:", x: 430, y: 80, width: 90, size: 8, font: .boldSystemFont(ofSize: 8), context: context)

        drawText("Директор ООО \"ТЕХНОЛОГИИ БЕЗОПАСНОСТИ\"", x: left, y: 95, width: 220, size: 6.5, context: context)
        drawLine(from: CGPoint(x: left, y: 118), to: CGPoint(x: 175, y: 118), lineWidth: 0.6, context: context)
        drawText("И. Н. Симон", x: 178, y: 114, width: 56, size: 6, context: context)

        drawLine(from: CGPoint(x: 430, y: 118), to: CGPoint(x: 480, y: 118), lineWidth: 0.6, context: context)
        drawLine(from: CGPoint(x: 430, y: 132), to: CGPoint(x: 480, y: 132), lineWidth: 0.6, context: context)
        drawLine(from: CGPoint(x: 510, y: 132), to: CGPoint(x: 548, y: 132), lineWidth: 0.6, context: context)
        drawText("2023 г.", x: 550, y: 128, width: 30, size: 6, context: context)

        drawLine(from: CGPoint(x: left, y: 132), to: CGPoint(x: 45, y: 132), lineWidth: 0.6, context: context)
        drawLine(from: CGPoint(x: 47, y: 132), to: CGPoint(x: 95, y: 132), lineWidth: 0.6, context: context)
        drawLine(from: CGPoint(x: 98, y: 132), to: CGPoint(x: 175, y: 132), lineWidth: 0.6, context: context)
        drawText("2023 г.", x: 176, y: 128, width: 30, size: 6, context: context)

        drawText("СМЕТА №", x: 0, y: 161, width: pageRect.width, size: 8, font: .boldSystemFont(ofSize: 8), alignment: .center, context: context)
        drawText("на проектные (изыскательские) работы", x: 0, y: 173, width: pageRect.width, size: 6, alignment: .center, context: context)

        let projectName = calculation.address.isEmpty ? calculation.navigationBarTitle : calculation.address
        drawText(projectName, x: 0, y: 197, width: pageRect.width, size: 6.5, font: .boldSystemFont(ofSize: 6.5), alignment: .center, context: context)

        drawLine(from: CGPoint(x: left, y: 208), to: CGPoint(x: right, y: 208), lineWidth: 0.6, context: context)
        drawText("Наименование предприятия, здания, сооружения, стадия проектирования, этап, вид проектных", x: left + 145, y: 203, width: 280, size: 4.5, alignment: .center, context: context)
        drawText("работ", x: left + 273, y: 208, width: 40, size: 4.5, alignment: .center, context: context)

        drawText("Наименование проектной (изыскательской) организации:", x: left, y: 218, width: 220, size: 6, context: context)
        drawText("ООО \"ТЕХНОЛОГИИ БЕЗОПАСНОСТИ\"", x: left + 16, y: 230, width: 210, size: 6.5, context: context)
        drawLine(from: CGPoint(x: left, y: 240), to: CGPoint(x: right, y: 240), lineWidth: 0.6, context: context)

        drawText("Наименование организации заказчика:", x: left, y: 252, width: 180, size: 6, context: context)
        drawText("\(projectName)", x: left + 16, y: 264, width: 220, size: 6.5, context: context)
        drawLine(from: CGPoint(x: left, y: 274), to: CGPoint(x: right, y: 274), lineWidth: 0.6, context: context)

        drawText("Стадия проектирования: Рабочий проект", x: left, y: 288, width: 260, size: 6.5, context: context)
        drawText("Вид проектных работ: Проектные работы по оснащению системой видеонаблюдения", x: left, y: 304, width: 360, size: 6, context: context)

        drawText("Итого по расчету:", x: left, y: 319, width: 110, size: 7, font: .boldSystemFont(ofSize: 7), context: context)
        drawText("\(calculation.cost.formattedWithSeparator)р.", x: left + 120, y: 319, width: 100, size: 7, font: .boldSystemFont(ofSize: 7), context: context)

        // MARK: Main table
        let tableTop: CGFloat = 333
        let widths: [CGFloat] = [22, 180, 214, 77, 50]
        let x = columnX(from: left, widths: widths)

        let headerH1: CGFloat = 40
        let headerH2: CGFloat = 16
        let sectionH: CGFloat = 16

        drawRowFrame(x: x, y: tableTop, height: headerH1 + headerH2, context: context)

        drawText("№\nп\nп", x: x[0] + 2, y: tableTop + 7, width: widths[0] - 4, size: 6, alignment: .center, context: context)
        drawText("Характеристика предприятия,\nздания, сооружения или вида работ", x: x[1] + 4, y: tableTop + 11, width: widths[1] - 8, size: 5.5, alignment: .center, context: context)
        drawText("Номер части, главы, таблицы, параграфов и пунктов указаний к\nразделу справочника, базовых цен на проектные и\nизыскательские работы для строительства", x: x[2] + 4, y: tableTop + 8, width: widths[2] - 8, size: 5, alignment: .center, context: context)
        drawText("расчет стоимости: (а+в)X*\nили\n(a+b)стоимость строительного\nили\nработ)" , x: x[3] + 3, y: tableTop + 7, width: widths[3] - 6, size: 4.7, alignment: .center, context: context)
        drawText("Стоимость\nработ,\nруб.", x: x[4] + 3, y: tableTop + 10, width: widths[4] - 6, size: 5.5, alignment: .center, context: context)

        drawLine(from: CGPoint(x: left, y: tableTop + headerH1), to: CGPoint(x: right, y: tableTop + headerH1), lineWidth: 0.7, context: context)
        drawText("1", x: x[0], y: tableTop + headerH1 + 4, width: widths[0], size: 6, alignment: .center, context: context)
        drawText("2", x: x[1], y: tableTop + headerH1 + 4, width: widths[1], size: 6, alignment: .center, context: context)
        drawText("3", x: x[2], y: tableTop + headerH1 + 4, width: widths[2], size: 6, alignment: .center, context: context)
        drawText("4", x: x[3], y: tableTop + headerH1 + 4, width: widths[3], size: 6, alignment: .center, context: context)
        drawText("5", x: x[4], y: tableTop + headerH1 + 4, width: widths[4], size: 6, alignment: .center, context: context)

        let sectionY = tableTop + headerH1 + headerH2
        drawRowFrame(x: x, y: sectionY, height: sectionH, context: context)
        drawText("Раздел 1. Автоматическая система охраны", x: x[1] + 2, y: sectionY + 5, width: widths[1] + widths[2] + widths[3] + widths[4] - 4, size: 6.5, font: .boldSystemFont(ofSize: 6.5), context: context)

        let items = makeItems(from: calculation)
        var rowY = sectionY + sectionH

        for item in items {
            let h = item.height
            drawRowFrame(x: x, y: rowY, height: h, context: context)
            drawText(item.number, x: x[0] + 2, y: rowY + 4, width: widths[0] - 4, size: 6, alignment: .center, context: context)
            drawText(item.workName, x: x[1] + 3, y: rowY + 3, width: widths[1] - 6, size: 5.2, context: context)
            drawText(item.reference, x: x[2] + 3, y: rowY + 3, width: widths[2] - 6, size: 5.1, context: context)
            drawText(item.formula, x: x[3] + 2, y: rowY + 4, width: widths[3] - 4, size: 5.1, alignment: .center, context: context)
            drawText(item.cost, x: x[4] + 2, y: rowY + 4, width: widths[4] - 4, size: 5.8, alignment: .right, context: context)
            rowY += h
        }

        let totalRows: [(String, String)] = [
            ("Итоги по смете", calculation.cost.formattedWithSeparator),
            ("Всего с учетом \"Понижающего договорного коэффициента Кдог 1,0\"", calculation.cost.formattedWithSeparator),
            ("НДС не предусмотрен. Глава 26.2 НК РФ \"Упрощенная система налогообложения\"", ""),
            ("Всего", calculation.cost.formattedWithSeparator)
        ]

        for (title, value) in totalRows {
            let h: CGFloat = 15
            drawRowFrame(x: x, y: rowY, height: h, context: context)
            drawText(title, x: x[1] + 3, y: rowY + 4, width: widths[1] + widths[2] + widths[3] - 6, size: 5.6, font: title == "Всего" ? .boldSystemFont(ofSize: 5.8) : .systemFont(ofSize: 5.6), context: context)
            drawText(value, x: x[4] + 2, y: rowY + 4, width: widths[4] - 4, size: 5.8, font: title == "Всего" ? .boldSystemFont(ofSize: 5.8) : .systemFont(ofSize: 5.8), alignment: .right, context: context)
            rowY += h
        }

        drawText("Составил:", x: 250, y: rowY + 30, width: 45, size: 6, context: context)
        drawLine(from: CGPoint(x: 295, y: rowY + 36), to: CGPoint(x: 445, y: rowY + 36), lineWidth: 0.6, context: context)
        drawText("Симон И. Н.", x: 405, y: rowY + 30, width: 45, size: 6, context: context)
        drawText("(должность, подпись, расшифровка)", x: 250, y: rowY + 41, width: 150, size: 4.8, context: context)
    }

    private func makeItems(from calculation: Calculation) -> [FormItem] {
        var output: [FormItem] = []

        let baseReference = "СБЦ \"Системы противопожарной и охранной защиты\"\n(1999) Табл. 3 п.7\n\nК=1\n\nКоэфф./принятые значения:\n"

        let factors = buildFactors(calculation: calculation)
        let firstCost = stageCost(calculation: calculation, stageIndex: 0)
        let secondCost = stageCost(calculation: calculation, stageIndex: 1)

        output.append(FormItem(number: "1",
                               workName: "Автоматическая установка пожарной сигнализации, защищающая объект площадью \(objectAreaText(calculation))",
                               reference: baseReference + factors,
                               formula: "(2397*1)\n*(A*X)*Ктек*Кстад",
                               cost: firstCost,
                               height: 116))

        output.append(FormItem(number: "2",
                               workName: "Система оповещения людей о пожаре на объекте площадью: \(objectAreaText(calculation)), 1 объект",
                               reference: baseReference + factors,
                               formula: "(2397*1)\n*(A*X)*Ктек*Кстад",
                               cost: secondCost,
                               height: 104))

        return output
    }

    private func buildFactors(calculation: Calculation) -> String {
        var lines: [String] = []

        for value in calculation.valueCoef where value.type != .address {
            lines.append("\(value.type.title): \(value.value.formattedWithSeparator) \(value.type.descrp)")
        }

        for choice in calculation.choiceCoef {
            let selected = choice.type.items[safe: choice.itemIndex ?? 0] ?? "-"
            lines.append("\(choice.type.title): \(selected)")
        }

        for checkbox in calculation.checkboxСoef where checkbox.isSelected {
            lines.append("\(checkbox.type.title): да")
        }

        return lines.prefix(8).joined(separator: "\n")
    }

    private func objectAreaText(_ calculation: Calculation) -> String {
        if let area = calculation.valueCoef.first(where: { $0.type == .objectArea })?.value,
           area > 0 {
            return "\(area.formattedWithSeparator) м2"
        }
        return "2000-3000 м2"
    }

    private func stageCost(calculation: Calculation, stageIndex: Int) -> String {
        guard calculation.calculationResult.indices.contains(stageIndex),
              let price = calculation.calculationResult[stageIndex].prices.first?.value else {
            return stageIndex == 0 ? calculation.cost.formattedWithSeparator : ""
        }
        return price.formattedWithSeparator
    }

    private func drawRowFrame(x: [CGFloat], y: CGFloat, height: CGFloat, context: CGContext) {
        for vertical in x {
            drawLine(from: CGPoint(x: vertical, y: y),
                     to: CGPoint(x: vertical, y: y + height),
                     lineWidth: 0.6,
                     context: context)
        }
        drawLine(from: CGPoint(x: x[0], y: y), to: CGPoint(x: x.last ?? right, y: y), lineWidth: 0.6, context: context)
        drawLine(from: CGPoint(x: x[0], y: y + height), to: CGPoint(x: x.last ?? right, y: y + height), lineWidth: 0.6, context: context)
    }

    private func columnX(from start: CGFloat, widths: [CGFloat]) -> [CGFloat] {
        var result: [CGFloat] = [start]
        var current = start
        for width in widths {
            current += width
            result.append(current)
        }
        return result
    }

    private func drawLine(from: CGPoint, to: CGPoint, lineWidth: CGFloat, context: CGContext) {
        context.setLineWidth(lineWidth)
        context.move(to: from)
        context.addLine(to: to)
        context.strokePath()
    }

    private func drawText(_ text: String,
                          x: CGFloat,
                          y: CGFloat,
                          width: CGFloat,
                          size: CGFloat,
                          font: UIFont? = nil,
                          alignment: NSTextAlignment = .left,
                          context: CGContext) {
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = alignment
        paragraph.lineBreakMode = .byWordWrapping

        let actualFont = font ?? UIFont.systemFont(ofSize: size)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: actualFont,
            .paragraphStyle: paragraph,
            .foregroundColor: UIColor.black
        ]

        let rect = CGRect(x: x, y: y, width: width, height: 200)
        NSString(string: text).draw(with: rect,
                                    options: [.usesLineFragmentOrigin, .usesFontLeading],
                                    attributes: attributes,
                                    context: nil)
    }

    private func currentYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: Date())
    }

    private func safeFileName(from rawName: String) -> String {
        let invalidCharacters = CharacterSet(charactersIn: "\\/:*?\"<>|")
        let cleaned = rawName.components(separatedBy: invalidCharacters).joined(separator: "_")
        return cleaned.isEmpty ? "Расчет" : cleaned
    }
}

private struct FormItem {
    let number: String
    let workName: String
    let reference: String
    let formula: String
    let cost: String
    let height: CGFloat
}

private extension Array {
    subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
