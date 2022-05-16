//
//  PDFCreator.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import PDFKit

final class PDFCreator : NSObject {
    
    private(set) var renderer: UIGraphicsPDFRenderer?
    
    init(title: String, pageRect: CGRect) {
        let format = UIGraphicsPDFRendererFormat()
        let metaData = [
            kCGPDFContextCreator: "AnyMinResume",
            kCGPDFContextAuthor: "Abderrahman Ajid",
            kCGPDFContextTitle: title
        ]
        format.documentInfo = metaData as [String: Any]
        self.renderer = UIGraphicsPDFRenderer(
            bounds: pageRect,
            format: format
        )
    }
    
    deinit {
        self.renderer = nil
    }
    
    func pdfDoc(_ pdfData: Data?) -> PDFDocument? {
        guard let pdfData = pdfData else {
            return nil
        }
        return PDFDocument(data: pdfData)
    }
}

extension PDFCreator {
    
    func addImage(_ image:  UIImage?, rect: CGRect) {
        guard let image = image else {
            return
        }
        image.draw(in: rect)
    }
    
    func addText(_ value: String, rect: CGRect, size: CGFloat) {
        value.draw(in: rect, withAttributes: [ .font: UIFont.systemFont(ofSize: size) ])
    }
    
    func addParagraph(_ value: String, rect: CGRect, size: CGFloat) {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: size),
            .paragraphStyle: paragraphStyle
        ]
        
        value.draw(in: rect, withAttributes: attributes)
        
    }

}
