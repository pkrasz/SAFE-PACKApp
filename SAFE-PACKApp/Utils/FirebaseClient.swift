//
//  ApiClient.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import UIKit
import PDFKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseStorageSwift

final class FirebaseClient {
    
    // MARK: - Properties
    
    static var shared = FirebaseClient()
    private var db: Firestore?
    private var storage: Storage?
    private var storageRef: StorageReference?
    
    func setupClient() {
        FirebaseApp.configure()
        db = .firestore()
        storage = .storage()
        storageRef = storage?.reference()
    }
    
    func addOrder(userUID: String, with order: Order, completion: @escaping (Bool) -> Void) {
        
        let orderID = String(order.orderNumber)
        
        do {
            try db?.collection(userUID).document("ordersData").collection("orders").document(orderID).setData(from: order)
            completion(true)
        } catch let error {
            print("Error writing city to Firestore: \(error)")
            completion(false)
        }
    }
    
    func createUserInfo(userUID: String, name: String, NIP: Int, address: String) {
        db?.collection(userUID)
            .document("accountInfo").setData(["companyName" : name, "NIP" : NIP, "address" : address])
    }
    
    func updateUserInfo(userUID: String, name: String, NIP: Int, address: String) {
        db?.collection(userUID)
            .document("accountInfo").updateData(["companyName" : name, "NIP" : NIP, "address" : address])
    }
    
    func getAccountInfo(userUID: String, completion: @escaping (UserInfo) -> Void) {
        db?.collection(userUID).document("accountInfo").getDocument(as: UserInfo.self) { result in
            switch result {
            case.success(let userInfo):
                completion(userInfo)
            case.failure(let error):
                print("ERROR! : \(error)")
            }
        }
    }
    
    func getProducts(completion: @escaping ([Product]) -> Void) {
        db?.collection("Products").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var products: [Product] = []
                for document in querySnapshot!.documents {
                    let doc = try? document.data(as: Product.self)
                    guard let doc = doc else {return}
                    products.append(doc)
                }
                completion(products)
            }
        }
    }
    
    func getOrders(userID: String, completion: @escaping ([Order]) -> Void) {
        db?.collection(userID).document("ordersData").collection("orders").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var orders: [Order] = []
                for document in querySnapshot!.documents {
                    let doc = try? document.data(as: Order.self)
                    guard let doc = doc else {return}
                    orders.append(doc)
                }
                completion(orders)
            }
        }
    }
    
    func setImage(name: String, completion: @escaping (UIImage?) -> Void) {
        let fileName: String = "images/\(name).png"
        let imageRef = storageRef?.child(fileName)
        imageRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                completion(image)
            }
        }
    }
    
    func addInvoiceFolders(userName: String, userID: String, orderNumber: String) {
        let data = Data()
        let folderName: String = userName + Labels.Text.dash + userID
        let ghostDocument: String = "invoices.txt"
        let fileName: String = folderName + Labels.Text.slash + orderNumber + Labels.Text.slash + ghostDocument
        let imageRef = storageRef?.child(fileName)
        imageRef?.putData(data, metadata: nil) { (metadata, error) in
            guard metadata != nil else {
                guard let error = error else {return}
                print(error.localizedDescription)
                return
            }
            imageRef?.downloadURL { (url, error) in
                guard url != nil else {
                    guard let error = error else {return}
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
    
    func getInvoices(userName: String, userID: String, orderNumber: String, documentName: String, completion: @escaping (PDFDocument?) -> Void) {
        let folderName: String = userName + Labels.Text.dash + userID
        let fileName: String = folderName + Labels.Text.slash + orderNumber + Labels.Text.slash + documentName
        let imageRef = storageRef?.child(fileName)
        
        imageRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error.localizedDescription)
                print("ERROR")
                print(error)
                print("FILE:")
                print(fileName)
            } else {
                let image = PDFDocument(data: data!)
                completion(image)
            }
        }
    }
}
