//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Paulo Matheus on 12/03/26.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var sucessResult: ((String) -> Void)?
    func doAuth(usernameLogin: String, password: String){
        print(usernameLogin)
        Auth.auth().signIn(withEmail: usernameLogin, password: password){ [weak self] result, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            } else {
                self?.sucessResult?(usernameLogin)
                if let result = result {
                    print(result, "User signed in successfully")
                }
            }
        }
            
    }
}
 
