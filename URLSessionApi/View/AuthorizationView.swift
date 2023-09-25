//
//  AuthorizationView.swift
//  URLSessionApi
//
//  Created by User on 25.09.2023.
//

import UIKit
import SnapKit

class AuthorizationView: UIViewController {
    let customColorFon = UIColor(named: "FonColor")?.withAlphaComponent(0.9)
    let loginTextField = UITextField()
    let signUpTitleView = UILabel()
    let passwordTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }
    private func setupe() {
        view.addSubview(loginTextField)
        view.addSubview(signUpTitleView)
        view.addSubview(passwordTextField)
        constraints()
        setting()
    }
    private func constraints() {
        loginTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(signUpTitleView.snp.bottom).offset(150)
            make.height.equalTo(50)
        }
        signUpTitleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(loginTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
    private func setting() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        view.backgroundColor = customColorFon
        //MARK: setting entranceLabel
        signUpTitleView.text = "ВХОД"
        signUpTitleView.font = .boldSystemFont(ofSize: 40)
        //MARK: loginTextField
        loginTextField.placeholder = "ЛОГИН"
        loginTextField.clearButtonMode = .always
        loginTextField.returnKeyType = UIReturnKeyType.go
        loginTextField.layer.borderColor = UIColor.black.cgColor
        loginTextField.layer.borderWidth = 2.0
        loginTextField.layer.cornerRadius = 10
        loginTextField.leftView = paddingView
        loginTextField.leftViewMode = .always
        //MARK: passwordTextField
        passwordTextField.placeholder = "Пароль"
        passwordTextField.clearButtonMode = .always
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 2.0
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = .always
    }
}
