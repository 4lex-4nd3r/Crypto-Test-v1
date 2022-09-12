//
//  LoginManager.swift
//  Crypto-Test-v1
//
//  Created by Александр on 12.09.2022.
//

import UIKit

//#fixed
//#error("сделай отдельным классом")

class LoginManager {
   
   static let shared = LoginManager()
   private init() {}
   
   func getRootVC() -> UIViewController {
      //#fixed
      //#error("через энум ключей")
      let defaults = UserDefaults.standard
      if let isLogged = defaults.object(forKey: UserDefaultsKeys.loginKey.rawValue) as? String {
         switch isLogged {
         case UserDefaultsKeys.loginKey.rawValue:
            let nav = UINavigationController(rootViewController: CoinsViewController())
            return nav
         default:
            let nav = UINavigationController(rootViewController: LoginViewController())
            return nav
         }
      } else {
         let nav = UINavigationController(rootViewController: LoginViewController())
         return nav
      }
   }
}
