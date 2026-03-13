//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Paulo Matheus on 12/03/26.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    func doAuth(usernameLogin: String, password: String){
        print(usernameLogin)
        Auth.auth().signIn(withEmail: usernameLogin, password: password){ [weak self] authResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            } else {
                print(authResult, "User signed in successfully")
            }
        }
            
    }
}
