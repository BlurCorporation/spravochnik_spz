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
        // 1
        let pdfMetaData = [
            kCGPDFContextCreator: "Flyer Builder",
            kCGPDFContextAuthor: "raywenderlich.com"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        // 2
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        // 3
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        // 4
        let data = renderer.pdfData { (context) in
            // 5
            context.beginPage()
            // 6
            let attributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
            ]
            let text = "I'm a PDF!"
            text.draw(at: CGPoint(x: 0, y: 0), withAttributes: attributes)
        }
        
        let pdfDocument = PDFDocument(data: data)
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
