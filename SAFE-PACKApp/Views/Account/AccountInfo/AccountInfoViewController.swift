//
//  RegisterViewController.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit

final class AccountInfoViewController: BaseViewController<AccountView> {
    
    //MARK: - Properites
    
    var newUser: Bool
    var informationDidChange: [Bool] = [false, false, false]
    
    //MARK: - Initializator
    
    init(newUser: Bool) {
        self.newUser = newUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    
    override func setupView() {
        contentView.emailLabel.text = UserSession.shared.UserInfo(about: User.email)
        
        if newUser == true {
            navigationItem.setHidesBackButton(true, animated: true)
            showAlert(title: Alert.Title.completeTheRegostration, message: Alert.Messege.fillTheData, actions: [Alert.Action.continue])
        } else {
            navigationItem.setHidesBackButton(false, animated: true)
            FirebaseClient.shared.getAccountInfo(userUID: UserSession.shared
                .UserInfo(about: User.id)) { [weak self] userInfo in
                    self?.contentView.nameTextField.text = userInfo.companyName
                    self?.contentView.NIPTextField.text = String(userInfo.NIP)
                    self?.contentView.deliveryAddressTextField.text = userInfo.address
                }
        }
    }
    
    override func setupBindings() {
        let tapApproveButton = UIAction { [unowned self] _ in
            
            var allDidEdit: Bool = false
            var didEdit: Bool = false
            
            if informationDidChange.allSatisfy({$0}) {
                allDidEdit = true
            }
            
            for edit in informationDidChange {
                if edit == true {
                    didEdit = true
                }
            }
            
            let name = contentView.nameTextField.text
            let NIP = contentView.NIPTextField.text
            let address = contentView.deliveryAddressTextField.text
            
            if newUser == false {
                guard let name = name else { return}
                guard let NIP = NIP else {return}
                guard let address = address else {return}
                let NIPInt = Int(NIP)
                guard let NIPInt = NIPInt else {return}
                if didEdit == true {
                    
                    FirebaseClient.shared.updateUserInfo(userUID: UserSession.shared
                        .UserInfo(about: User.id), name: name, NIP: NIPInt, address: address)
                    
                    var alertMessege: String = Empty.string
                    
                    for index in 0..<informationDidChange.count {
                        if informationDidChange[index] == true {
                            switch index {
                            case 0:
                                alertMessege += Labels.Text.name + Labels.Text.dash + name
                            case 1:
                                alertMessege += Labels.Text.slash + Labels.Text.NIP + Labels.Text.dash + NIP
                            case 2:
                                alertMessege += Labels.Text.slash + Labels.Text.deliveryAddress + Labels.Text.dash + address
                            default:
                                Void()
                            }
                        }
                    }
                    
                    showAlert(title: Alert.Title.change, message: alertMessege, actions: [UIAlertAction(title: Alert.ActionTitle.close, style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    })])
                } else {
                    showAlert(title: Alert.Title.noChange, message: Alert.Messege.noChange, actions: [UIAlertAction(title: Alert.ActionTitle.close, style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    })])
                }
            } else {
                guard let name = name else { return}
                guard let NIP = NIP else {return}
                guard let address = address else {return}
                let NIPInt = Int(NIP)
                guard let NIPInt = NIPInt else {return}
                
                if allDidEdit == false ||
                    name == Empty.string ||
                    NIP == Empty.string ||
                    address == Empty.string {
                    showAlert(title: Alert.Title.registrationNotCompleted, message: Alert.Messege.registrationNotCompleted, actions: [UIAlertAction(title: Alert.ActionTitle.close, style: .default, handler: nil)])
                } else {
                    FirebaseClient.shared.createUserInfo(userUID: UserSession.shared.UserInfo(about: User.id), name: name, NIP: NIPInt, address: address)
                    
                    let messege: String = Labels.Text.slash + Labels.Text.deliveryAddress + Labels.Text.dash + address
                    newUser = false
                    
                    showAlert(title: Alert.Title.registrationComplete, message: messege, actions: [UIAlertAction(title: Alert.ActionTitle.goToAccount, style: .default, handler: { (action) in self.navigationController?.popToRootViewController(animated: false)
                    })])
                }
            }
        }
        contentView.approveButton.addAction(tapApproveButton, for: .touchUpInside)
        
        let nameTextFieldIsEditing = UIAction { _ in
            self.informationDidChange[0] = true
        }
        contentView.nameTextField.addAction(nameTextFieldIsEditing, for: .editingDidBegin)
        
        let NIPTextFieldIsEditing = UIAction { _ in
            self.informationDidChange[1] = true
        }
        contentView.NIPTextField.addAction(NIPTextFieldIsEditing, for: .editingDidBegin)
        
        let deliveryAddressTextFieldIsEditing = UIAction { _ in
            self.informationDidChange[2] = true
        }
        contentView.deliveryAddressTextField.addAction(deliveryAddressTextFieldIsEditing, for: .editingDidBegin)
    }
}

