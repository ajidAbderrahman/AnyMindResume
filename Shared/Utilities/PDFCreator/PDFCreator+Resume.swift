//
//  PDFCreator+Resume.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import PDFKit

// MARK: Resume PDF
final class ResumePDF {
    
    private let resume: Resume
    private let pageRect = CGRect(x: 0, y: 0, width: (8.5 * 72.0), height: (11 * 72.0))
    private let pdfCreator: PDFCreator
    
    init(from resume: Resume) {
        self.resume = resume
        self.pdfCreator = PDFCreator(title: resume.title, pageRect: pageRect)
    }
    
    private var totalHeight: CGFloat = 10
    private let textFontSize: CGFloat = 18
    private let titleFontSize: CGFloat = 25
    
    private var addNewPage: (() -> Void)?
    
    // return the pdf drawing as a Data object
    private var pdfData: Data? {
        
        guard let renderer = pdfCreator.renderer else {
            return nil
        }
        
        let data = renderer.pdfData { context in
            context.beginPage()
            addPersonalInfo(resume.personalInfo)
            addSkills(resume.skills)
            addWorks(resume.works)
        }
        return data
    }
    
    var data: Data? {
        pdfCreator.pdfDoc(pdfData)?.dataRepresentation()
    }
    
    // provide size and position for each element
    // also calculate total Height for all elements
    private func rect(for type: ElementType) -> CGRect {
        var rectangle = CGRect.zero
        switch type {
        case .image: rectangle = CGRect(x: 10, y: totalHeight, width: 100, height: 100)
        case .title: rectangle = CGRect(x: 10, y: totalHeight, width: pageRect.width - 20, height: 35)
        case .text: rectangle = CGRect(x: 10, y: totalHeight, width: pageRect.width - 20, height: 25)
        case .paragraph: rectangle = CGRect(x: 10, y: totalHeight, width: pageRect.width - 20, height: 80)
        }
        totalHeight += rectangle.height
        return rectangle
    }
    
    // PDF supported elements
    private enum ElementType {
        case image
        case title
        case text
        case paragraph
    }
    
    // MARK: Resume helpers method
    private func addPersonalInfo(_ info: PersonalInfo) {
        pdfCreator.addImage(info.image, rect: rect(for: .image))
        pdfCreator.addText(info.fullName, rect: rect(for: .title), size: titleFontSize)
        pdfCreator.addText("mobile: \(info.mobile)", rect: rect(for: .text), size: textFontSize)
        pdfCreator.addText("email: \(info.email)", rect: rect(for: .text), size: textFontSize)
        pdfCreator.addText("address: \(info.address)", rect: rect(for: .text), size: textFontSize)
        pdfCreator.addText("\(info.yearsOfExperience) years of experience", rect: rect(for: .text), size: textFontSize)
        pdfCreator.addText("OBJECTIVES", rect: rect(for: .title), size: titleFontSize)
        pdfCreator.addParagraph(info.objectives, rect: rect(for: .paragraph), size: textFontSize)
    }
    
    private func addSkills(_ skills: Skills) {
        pdfCreator.addText("SKILLS", rect: rect(for: .title), size: titleFontSize)
        skills.forEach { skill in
            pdfCreator.addText(skill.name, rect: rect(for: .text), size: textFontSize)
        }
    }
    
    private func addWorks(_ works: Works) {
        pdfCreator.addText("Works", rect: rect(for: .title), size: titleFontSize)
        works.forEach { work in
            pdfCreator.addText("Company name: \(work.name)", rect: rect(for: .text), size: textFontSize)
            pdfCreator.addText("Start Date: \(work.startDate)", rect: rect(for: .text), size: textFontSize)
            pdfCreator.addText("End Date: \(work.endDate)", rect: rect(for: .text), size: textFontSize)
        }
    }
    
}

// MARK: PDF Creator
final fileprivate class PDFCreator : NSObject {
    
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
