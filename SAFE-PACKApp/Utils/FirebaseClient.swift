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
    
    //MARK: - Methods
    
    func setupClient() {
        FirebaseApp.configure()
        db = .firestore()
        storage = .storage()
        storageRef = storage?.reference()
    }
    
    func addOrder(userUID: String, with order: Order, completion: @escaping (Bool) -> Void) {
        let orderID = String(order.orderNumber)
        
        do {
            try db?.collection(userUID).document(Constants.ordersData).collection(Constants.orders).document(orderID).setData(from: order)
            completion(true)
        } catch let error {
            print(Constants.error + error.localizedDescription)
            completion(false)
        }
    }
    
    func createUserInfo(userUID: String, name: String, NIP: Int, address: String) {
        db?.collection(userUID)
            .document(Constants.accountInfo).setData([Constants.companyName : name, Constants.NIP : NIP, Constants.address : address])
    }
    
    func updateUserInfo(userUID: String, name: String, NIP: Int, address: String) {
        db?.collection(userUID)
            .document(Constants.accountInfo).updateData([Constants.companyName : name, Constants.NIP : NIP, Constants.address : address])
    }
    
    func getAccountInfo(userUID: String, completion: @escaping (UserInfo) -> Void) {
        db?.collection(userUID).document(Constants.accountInfo).getDocument(as: UserInfo.self) { result in
            switch result {
            case.success(let userInfo):
                completion(userInfo)
            case.failure(let error):
                print(Constants.error + error.localizedDescription)
            }
        }
    }
    
    func getProducts(completion: @escaping ([Product]) -> Void) {
        db?.collection(Constants.products).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(Constants.error + err.localizedDescription)
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
        db?.collection(userID).document(Constants.ordersData).collection(Constants.orders).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print(Constants.error + err.localizedDescription)
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
        let fileName: String = Constants.images + name + Constants.png
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
        let ghostDocument: String = Constants.invoiceTxt
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
            } else {
                let image = PDFDocument(data: data!)
                completion(image)
            }
        }
    }
}

    //MARK: - Extensions
extension FirebaseClient {
    enum Constants {
        static let ordersData: String = "ordersData"
        static let orders: String = "orders"
        static let accountInfo: String = "accountInfo"
        static let companyName: String = "companyName"
        static let NIP: String = "NIP"
        static let address: String = "address"
        static let products: String = "Products"
        static let invoiceTxt: String = "invoices.txt"
        static let images: String = "images/"
        static let png: String = ".png"
        static let error: String = "Error! : "
    }
}
