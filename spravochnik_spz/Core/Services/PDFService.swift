//
//  PDFService.swift
//  spravochnik_spz
//
//  Created by Максим Косников on 29.09.2023.
//

import Foundation
import PDFKit

protocol PDFServiceProtocol {
    func generatePDF(from text: String) -> URL?
}

final class PDFService {
    
}

extension PDFService: PDFServiceProtocol {
    func generatePDF(from text: String) -> URL? {
//        // 1
//        let pdfMetaData = [
//            kCGPDFContextCreator: "Flyer Builder",
//            kCGPDFContextAuthor: "raywenderlich.com"
//        ]
//        let format = UIGraphicsPDFRendererFormat()
//        format.documentInfo = pdfMetaData as [String: Any]
//
//        // 2
//        let pageWidth = 8.5 * 72.0
//        let pageHeight = 11 * 72.0
//        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
//
//        // 3
//        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
//        // 4
//        let data = renderer.pdfData { (context) in
//            // 5
//            context.beginPage()
//            // 6
//            let attributes = [
//                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
//            ]
//            let text = "I'm a PDF!"
//            text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
//
//        }
        
//        let url = Bundle.main.url(forResource: "securityAlarm1.pdf", withExtension: "pdf") // (forResource: "securityAlarm1.pdf", ofType: "pdf")
        
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDirectoryPath = paths.first
        let pdfPath = docDirectoryPath!.appendingPathComponent("Охранная сигнализация_1_расчетsecurityAlarm1.pdf")

//        let data = try? Data(contentsOf: pdfPath)
        
        let path = Bundle.main.path(forResource: "securityAlarm1",  ofType:"pdf")
        let fileURL = URL(fileURLWithPath: path!)
        
//        let data = NSData(data: URLRequest(url: url))
        let pdfDocument = PDFDocument(url: fileURL)

        guard let pdfDocument = pdfDocument else { return nil }
        do {
            let tempDirectory = FileManager.default.temporaryDirectory
            let pdfURL = tempDirectory.appendingPathComponent("shared.pdf")

            try pdfDocument.write(to: pdfURL)
            return pdfURL
        } catch {
            print("Error saving PDF: \(error.localizedDescription)")
            return nil
        }
    }
}
