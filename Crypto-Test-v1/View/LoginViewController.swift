//
//  LoginViewController.swift
//  Crypto-Test-v1
//
//  Created by Александр on 09.09.2022.
//

import UIKit

class LoginViewController : UIViewController {
   
   // MARK: - Properties
   
   private let emailTextField: UITextField = {
      let tf = UITextField()
      tf.text = "12345"
      tf.backgroundColor = .systemGray6
      tf.font = UIFont.systemFont(ofSize: 18)
      tf.placeholder = "введите логин"
      tf.textAlignment = .center
      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      tf.clearButtonMode = .always
      
      tf.layer.masksToBounds = true
      tf.layer.cornerRadius = 10
      tf.borderStyle = .none
      
      tf.returnKeyType = .next
      tf.translatesAutoresizingMaskIntoConstraints = false
      return tf
   }()
   
   private let passwordTextField: UITextField = {
      let tf = UITextField()
      tf.text = "12345"

      tf.backgroundColor = .systemGray6
      tf.font = UIFont.systemFont(ofSize: 18)
      tf.placeholder = "введите пароль"
      tf.textAlignment = .center

      tf.autocorrectionType = .no
      tf.autocapitalizationType = .none
      tf.clearButtonMode = .always
      tf.layer.masksToBounds = true
      tf.layer.cornerRadius = 10
      tf.borderStyle = .none
      
      tf.borderStyle = .none
      tf.returnKeyType = .done
      tf.translatesAutoresizingMaskIntoConstraints = false
      return tf
   }()
   
   private lazy var loginButton: UIButton = {
      let button = UIButton()
      button.setTitle("войти в аккаунт", for: .normal)
      button.setTitleColor(UIColor.white, for: .normal)
      button.backgroundColor = .systemBlue
      button.layer.cornerRadius = 5
      button.layer.shadowColor = UIColor.black.cgColor
      button.layer.shadowRadius = 4
      button.layer.shadowOpacity = 0.2
      button.layer.shadowOffset = CGSize(width: 0, height: 4)
      
      button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
   }()
   
   private let logoImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.image =  UIImage(named: "logo")
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
   }()
   
   private var loginStack = UIStackView()
   
   // MARK: - Lifecycle
   
   override func viewDidLoad() {
      super.viewDidLoad()
      setupViews()
      setConstraints()
      setDelegates()
      setupKeyboardHidesOnTap()
   }
   
   //MARK: - Setups
   
   private func setupViews() {
      view.backgroundColor = .systemBackground
      view.addSubview(logoImageView)
      loginStack = UIStackView(arrangedSubviews: [emailTextField,
                                                  passwordTextField,
                                                  loginButton])
      loginStack.axis = .vertical
      loginStack.spacing = 20
      loginStack.distribution = .fillEqually
      loginStack.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(loginStack)
   }
   
   private func setDelegates() {
      emailTextField.delegate = self
      passwordTextField.delegate = self
   }
   
   //MARK: - Selectors
   
   @objc private func loginButtonTapped() {
      
      guard let email = emailTextField.text, email.count > 4 else {
         self.alertOk(title: "Ошибка", message: "Неверный email")
         return
      }
      
      guard let password = passwordTextField.text, password.count > 4 else {
         self.alertOk(title: "Ошибка", message: "Неверный password")
         return
      }
      
      //переход, смена рут вью контроллера
      let defaults = UserDefaults.standard
      defaults.set(true, forKey: "isLogged")
      navigationController?.setViewControllers([ListViewController()], animated: true)
   }
   
   //MARK: - Constraints
   
   private func setConstraints() {
      
      NSLayoutConstraint.activate([
         logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         logoImageView.heightAnchor.constraint(equalToConstant: 40),
         logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
         logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
      ])
      
      NSLayoutConstraint.activate([
         loginStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
         loginStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
         loginStack.bottomAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -40),
      ])
   }
}

extension LoginViewController: UITextFieldDelegate {
   
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if textField == emailTextField {
         passwordTextField.becomeFirstResponder()
      } else if textField == passwordTextField {
         passwordTextField.resignFirstResponder()
      }
      return true
   }
}
