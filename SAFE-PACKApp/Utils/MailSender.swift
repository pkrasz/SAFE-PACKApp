//
//  Mail.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 26/04/2022.
//

import Foundation
import MessageUI

class MailSender: NSObject, MFMailComposeViewControllerDelegate {

    let parentVC: UIViewController

    init(parentVC: UIViewController) {
        self.parentVC = parentVC
        super.init()
    }

    func send(title: String, messageBody: String, toRecipients: [String]) {
        if MFMailComposeViewController.canSendMail() {
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(title)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipients)
            parentVC.present(mc, animated: true, completion: nil)
        } else {
            print("No email account found.")
        }
    }

    private func mailComposeController(controller: MFMailComposeViewController,
        didFinishWithResult result: MFMailComposeResult, error: NSError?) {

            switch result.rawValue {
            case MFMailComposeResult.cancelled.rawValue: print("Mail Cancelled")
            case MFMailComposeResult.saved.rawValue: print("Mail Saved")
            case MFMailComposeResult.sent.rawValue: print("Mail Sent")
            case MFMailComposeResult.failed.rawValue: print("Mail Failed")
            default: break
            }

        parentVC.dismiss(animated: false, completion: nil)
    }
}

//let ms = MailSender(parentVC: self)
//let title = "Wiadomość z aplikacji"
//let messageBody = "Dzien dobry udalo sie :)"
//let toRecipents = ["pl.kraszewski@gmail.com"]
//ms.send(title: title, messageBody: messageBody, toRecipients: toRecipents)
