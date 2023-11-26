//
//  RegistrationViewController.swift
//  URLSessionApi
//
//  Created by User on 28.09.2023.
//

import UIKit
import SnapKit
import Firebase

class RegistrationViewController: UIViewController {
    let signUpTitleView = UILabel()
    let customColorBackground = UIColor(named: "FonColor")
    let nameUserTextField = UITextField()
    let closeViewButton = UIButton()
    let emailUserTextField = UITextField()
    let passwordUserTextField = UITextField()
    let passwordDetailsLabel = UILabel()
    let registrationIconImage = UIImageView()
    let registerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }
    private func setupe() {
        view.backgroundColor = customColorBackground
        view.addSubview(signUpTitleView)
        view.addSubview(nameUserTextField)
        view.addSubview(closeViewButton)
        view.addSubview(emailUserTextField)
        view.addSubview(passwordUserTextField)
        view.addSubview(passwordDetailsLabel)
        view.addSubview(registrationIconImage)
        view.addSubview(registerButton)
        constration()
        setting()
        addingPictures()
    }
    private func delegate() {
        nameUserTextField.delegate = self
        emailUserTextField.delegate = self
        passwordUserTextField.delegate = self
    }
    private func addingPictures() {
        if let image = UIImage(named: "registrationIcon") {
            registrationIconImage.image = image
        }else{
            print("ERROR image")
        }
    }
    private func constration() {
        signUpTitleView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        nameUserTextField.snp.makeConstraints { make in
            make.top.equalTo(registrationIconImage.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        closeViewButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
        }
        emailUserTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(nameUserTextField.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        passwordUserTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(emailUserTextField.snp.bottom).offset(30)
            make.height.equalTo(50)
        }
        passwordDetailsLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordUserTextField.snp.bottom).offset(3)
            make.left.right.equalToSuperview().inset(40)
        }
        registrationIconImage.snp.makeConstraints { make in
            make.top.equalTo(signUpTitleView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        registerButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(30)
            make.top.equalTo(passwordDetailsLabel).inset(200)
        }
    }
    private func setting() {
        let createPaddingViewNameUser = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: nameUserTextField.frame.height))
        let createPaddingViewEmailUser = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailUserTextField.frame.height))
        let createPaddingViewPasswordUser = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordUserTextField.frame.height))
        signUpTitleView.text = "РЕГИСТРАЦИЯ"
        signUpTitleView.font = .boldSystemFont(ofSize: 40)
        //MARK: closeViewButton
        closeViewButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeViewButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeViewButton.tintColor = .black
        //MARK: signUpTitleView
        nameUserTextField.placeholder = "ВВЕДИТЕ ВАШЕ ИМЯ"
        nameUserTextField.clearButtonMode = .always
        nameUserTextField.returnKeyType = .next
        nameUserTextField.layer.borderColor = UIColor.black.cgColor
        nameUserTextField.layer.borderWidth = 2.0
        nameUserTextField.layer.cornerRadius = 10
        nameUserTextField.leftView = createPaddingViewNameUser
        nameUserTextField.leftViewMode = .always
        nameUserTextField.autocorrectionType = .no
        //MARK: emailUserTextField
        emailUserTextField.placeholder = "ВВЕДИТЕ ВАШУ ПОЧТУ"
        emailUserTextField.clearButtonMode = .always
        emailUserTextField.returnKeyType = .next
        emailUserTextField.layer.borderColor = UIColor.black.cgColor
        emailUserTextField.layer.borderWidth = 2.0
        emailUserTextField.layer.cornerRadius = 10
        emailUserTextField.leftView = createPaddingViewEmailUser
        emailUserTextField.leftViewMode = .always
        emailUserTextField.autocapitalizationType = .none
        emailUserTextField.autocorrectionType = .no
        //MARK: passwordUserTextField
        passwordUserTextField.placeholder = "ПРИДУМАЙТЕ ПАРОЛЬ*"
        passwordUserTextField.clearButtonMode = .always
        passwordUserTextField.returnKeyType = .next
        passwordUserTextField.layer.borderColor = UIColor.black.cgColor
        passwordUserTextField.layer.borderWidth = 2.0
        passwordUserTextField.layer.cornerRadius = 10
        passwordUserTextField.leftView = createPaddingViewPasswordUser
        passwordUserTextField.leftViewMode = .always
        passwordUserTextField.autocapitalizationType = .none
        passwordUserTextField.autocorrectionType = .no
        passwordUserTextField.isSecureTextEntry = true
        //MARK: passwordDetailsLabel
        passwordDetailsLabel.text = "*пароль должен содержать от 8 символов и не использовать специальные знаки"
        passwordDetailsLabel.numberOfLines = 0
        passwordDetailsLabel.font = .systemFont(ofSize: 10)
        //MARK: registerButton
        registerButton.setTitle("ЗАРЕГЕСТРИРОВАТЬСЯ", for: .normal)
        registerButton.backgroundColor = customColorBackground
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 28)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.cornerRadius = 10
        registerButton.layer.borderWidth = 2.0
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.addTarget(self, action: #selector(registrationDatabase), for: .touchUpInside)
        
    }
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    private func showAuthorizationAlertError() {
        let alert = UIAlertController(title: "ОШИБКА", message: "ЗАПОЛНИТЕ ВСЕ ПОЛЯ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default , handler: nil))
        present(alert, animated: true, completion: nil)
    }
    private func successfulRegistration() {
        let alert = UIAlertController(title: "вы успешно зарегестрировались", message: "теперь вы можите авторизоваться", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension RegistrationViewController: UITextFieldDelegate {
    @objc func registrationDatabase() {
        let email = emailUserTextField.text!
        let password = passwordUserTextField.text!
        let name = nameUserTextField.text!
        
        if(!email.isEmpty && !password.isEmpty && !name.isEmpty) {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    if let result = result {
                        print(result.user.uid)
                        let ref = Database.database().reference().child("users")                     //Добовляем нашего пользователя в базу
                        ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                    }
                    self.successfulRegistration()
                }
            }
        }else {
            showAuthorizationAlertError()
        }
    }
}
