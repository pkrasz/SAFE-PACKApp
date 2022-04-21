//
//  ApiClient.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 06/04/2022.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import UIKit
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
            try db?.collection(userUID).document(orderID).setData(from: order)
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
    
    func setImage(name: String, completion: @escaping (UIImage?) -> Void) {
        //        let storage = Storage.storage()
        let fileName: String = "images/\(name).png"
        let imagesRef = storageRef?.child(fileName)
        imagesRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                completion(image)
            }
        }
    }
}

//    func addNewPackage() {
//        db?.collection("Product/Dupa/Cos")
//            .addDocument(data: ["title": "ttest"])
//        print("POSLZO COS TAM")
//    }

//    func allOrders(completion: ([String]) -> Void) {
//        //        db?.collection("orders").getDocuments(completion: { snapshot, error in
//        //            debugPrint(snapshot?.documents.map { $0.data() } )
//        //            debugPrint(error)
//        //        })
//    }
//
