//
//  UserSession.swift
//  SAFE-PACKApp
//
//  Created by Paweł Kraszewski on 15/04/2022.
//

import Foundation
import Firebase
import FirebaseAuth

enum User {
    static let id: String = "id"
    static let email: String = "email"
}

final class UserSession {
    
    //MARK: - Properties
    
    static var shared = UserSession()
    private var auth: Auth?
    
    func setupClient() {
        auth = .auth()
    }
    
    func loginStatus() -> Bool {
        if auth?.currentUser == nil {
            return false
        } else {
            return true
        }
    }
    
    func UserInfo(about: String) -> String {
        if about == User.id {
            let uid = auth?.currentUser?.uid
            guard let uid = uid else {return ""}
            return uid
        } else {
            let email = auth?.currentUser?.email
            guard let email = email else {return ""}
            return email

        }
    }
    func logIn(email: String, password: String, completion: @escaping (String, Bool) -> Void) {
        auth?.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                guard let error = error else {return}
                completion(error.localizedDescription, false)
            } else {
                completion("", true)
            }
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping (String, Bool) ->Void) {
        auth?.createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                guard let error = error else {return}
                completion(error.localizedDescription, false)
            } else {
                completion("", true)
            }
        }
    }
    
    func logOut() {
        do {
            try auth?.signOut()
        } catch let signOutError as NSError {
            print("Error!: \(signOutError)")
        }
    }
    
}
