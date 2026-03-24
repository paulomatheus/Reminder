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
    var errorResult: ((String) -> Void)?
    
    func doAuth(usernameLogin: String, password: String){
        print(usernameLogin)
        Auth.auth().signIn(withEmail: usernameLogin, password: password){ [weak self] result, error in
            if let error = error {
                self?.errorResult?("Erro ao realizar login, verifique as credenciais digitadas: \(error.localizedDescription)")
            } else {
                self?.sucessResult?(usernameLogin)
                if let result = result {
                    print(result, "User signed in successfully")
                }
            }
        }
            
    }
}
 
