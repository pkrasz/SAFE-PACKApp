//
//  ApiClient.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit

final class FirebaseClient {
    
    // MARK: - Properties
    
    static var shared = FirebaseClient()
    private var auth: Auth?
    private var db: Firestore?
    
    func setupClient() {
        FirebaseApp.configure()
        auth = .auth()
        db = .firestore()
    }
    
    func createUser(email: String, password: String, view: UIViewController, pushView: UIViewController, navigationController: UINavigationController) {
        auth?.createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                guard let error = error else {return}
                view.showAlert(title: "Error!", message: error.localizedDescription, actions: [UIAlertAction(title: "Back", style: .default, handler: nil)])
            } else {
                navigationController.pushViewController(pushView, animated: true)
            }
            
        }
    }
    func signIn(email: String, password: String, view: UIViewController, pushView: UIViewController, navigationController: UINavigationController) {
        auth?.signIn(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                guard let error = error else {return}
                view.showAlert(title: "Error!", message: error.localizedDescription, actions: [UIAlertAction(title: "Back", style: .default, handler: nil)])
            } else {
                navigationController.pushViewController(pushView, animated: true)
            }
        })
    }
    
    func createOrder(with title: String) {
        db?.collection(auth?.currentUser?.uid ?? "")
            .addDocument(data: ["title": title])
    }
    
    func addNewPackage() {
        db?.collection("Product/Dupa/Cos")
            .addDocument(data: ["title": "ttest"])
    }
    
    func allOrders(completion: ([String]) -> Void) {
        //        db?.collection("orders").getDocuments(completion: { snapshot, error in
        //            debugPrint(snapshot?.documents.map { $0.data() } )
        //            debugPrint(error)
        //        })
    }
    
}
