//
//  ViewController +.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

extension UIViewController {
   
   func setupKeyboardHidesOnTap() {
      let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
      tap.cancelsTouchesInView = true
      view.addGestureRecognizer(tap)
   }
   @objc private func dismissKeyboard() {
      view.endEditing(true)
   }
   
   func alertOk(title: String, message: String) {
      
      let alertController = UIAlertController(title: title,
                                              message: message,
                                              preferredStyle: .alert)
      let ok = UIAlertAction(title: "ok", style: .default)
      alertController.addAction(ok)
      present(alertController, animated: true)
   }
   
   func alertOkСancel(title: String, message: String, completion: @escaping (Bool) -> Void) {
      
      let alertController = UIAlertController(title: title,
                                              message: message,
                                              preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Да", style: .default) { _ in
         completion(true)
      }
      let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
      alertController.addAction(okAction)
      alertController.addAction(cancelAction)
      present(alertController, animated: true)
   }
}
