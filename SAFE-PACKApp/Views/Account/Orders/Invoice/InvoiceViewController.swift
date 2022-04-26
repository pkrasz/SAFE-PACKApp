//
//  SingleInvoiceViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 19/04/2022.
//

import UIKit
import PDFKit

final class InvoiceViewController: BaseViewController<InvoiceView> {
    
    //MARK: - Properties
    
    let order: Order
    var invoicePDF: PDFDocument? {
        didSet {
            let pdf = self.contentView.invoicePDFView
            pdf.document = invoicePDF
            pdf.autoScales = true
            pdf.minScaleFactor = pdf.scaleFactorForSizeToFit
            self.contentView.activityIndicatorView.isHidden = true
        }
    }
    
    //MARK: - Initializator
    
    init(selectedOrder: Order) {
        self.order = selectedOrder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    override func setupView() {
        let userID: String = UserSession.shared.UserInfo(about: User.id)
        var userName: String = "" {
            didSet {
                FirebaseClient.shared.getInvoices(userName: userName, userID: userID, orderNumber: order.orderNumber, documentName: order.documentName) { [weak self] image in
                    self?.invoicePDF = image
                    if self?.order.status == Status.awaitingPayment {
                        self?.contentView.availabilityUIImage.tintColor = Color.yellow
                    } else if self?.order.status == Status.unpaid {
                        self?.contentView.availabilityUIImage.tintColor = Color.red
                    } else {
                        self?.contentView.availabilityUIImage.tintColor = Color.darkGreen
                    }
                    
                }
            }
        }
        FirebaseClient.shared.getAccountInfo(userUID: userID) { userInfo in
            userName = userInfo.companyName
        } 
    }
    
    override func setupBindings() {
        let tapSaveToPhone = UIAction { [unowned self] _ in
            let pdfName = order.documentName
            guard let invoiceImage = invoicePDF else {return}
            guard let pdf = invoiceImage.dataRepresentation() else {return}

            let vc = UIActivityViewController(activityItems: [pdfName, pdf], applicationActivities: [])
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true)
        }
        contentView.saveToPhoneButton.addAction(tapSaveToPhone, for: .touchUpInside)
    }
}
