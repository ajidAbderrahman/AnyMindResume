//
//  ResumePDFCreator.swift
//  AnyMindResume
//
//  Created by Abderrahman Ajid on 15/5/2022.
//

import PDFKit

final class ResumePDFCreator {
    
    private let resume: Resume
    private let pageRect = CGRect(x: 0, y: 0, width: (8.5 * 72.0), height: (11 * 72.0))
    private let pdfCreator: PDFCreator
    
    init(_ resume: Resume) {
        self.resume = resume
        self.pdfCreator = PDFCreator(title: resume.title, pageRect: pageRect)
    }
    
    private var totalHeight: CGFloat = 10
    private let textFontSize: CGFloat = 18
    private let titleFontSize: CGFloat = 25
    
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
        skills.elements.forEach { value in
            pdfCreator.addText(value, rect: rect(for: .text), size: textFontSize)
        }
    }
    
    private func pdfData() -> Data? {
        
        guard let renderer = pdfCreator.renderer else {
            return nil
        }
        
        let data = renderer.pdfData { context in
            context.beginPage()
            addPersonalInfo(resume.personalInfo)
            addSkills(resume.skills)
            
        }
        return data
    }
    
    var resumePDF: PDFDocument? {
        pdfCreator.pdfDoc(pdfData())
    }
    
    private enum ElementType {
        case image
        case title
        case text
        case paragraph
    }
    
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
    
}
