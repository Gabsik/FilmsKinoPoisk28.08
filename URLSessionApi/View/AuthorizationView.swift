//
//  AuthorizationView.swift
//  URLSessionApi
//
//  Created by User on 25.09.2023.
//

import UIKit
import SnapKit
import Firebase

class AuthorizationView: UIViewController {
    let customColorBackground = UIColor(named: "FonColor")
    let customColorButton = UIColor(named: "ButtonColor")
    let loginTextField = UITextField()
    let signUpTitleView = UILabel()
    let passwordTextField = UITextField()
    let rememberPasswordButton = UIButton()
    let authorizationBitton = UIButton()
    let closeViewButton = UIButton()
    let loginIconImage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }
    private func setupe() {
        view.addSubview(loginTextField)
        view.addSubview(signUpTitleView)
        view.addSubview(passwordTextField)
        view.addSubview(rememberPasswordButton)
        view.addSubview(authorizationBitton)
        view.addSubview(closeViewButton)
        view.addSubview(loginIconImage)
        loginTextField.delegate = self
        passwordTextField.delegate = self
        constraints()
        setting()
        addingPictures()
    }
    private func addingPictures() {
        if let image = UIImage(named: "loginIcon") {
            loginIconImage.image = image
        }else{
            print("ERROR image")
        }
    }
    
    private func constraints() {
        loginTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().inset(50)
            make.top.equalTo(signUpTitleView.snp.bottom).offset(200)
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
        rememberPasswordButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(55)
            make.top.equalTo(passwordTextField.snp.bottom).offset(2)
        }
        authorizationBitton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(rememberPasswordButton.snp.bottom).offset(200)
        }
        closeViewButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(5)
            make.top.equalToSuperview().inset(5)
        }
        loginIconImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpTitleView.snp.bottom).offset(40)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    private func createPaddingView() -> UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
    }
    private func setting() {
        //let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        view.backgroundColor = customColorBackground
        //MARK: setting entranceLabel
        signUpTitleView.text = "ВХОД"
        signUpTitleView.font = .boldSystemFont(ofSize: 40)
        //MARK: loginTextField
        loginTextField.placeholder = "ЛОГИН"
        loginTextField.clearButtonMode = .always
        loginTextField.returnKeyType = UIReturnKeyType.next
        loginTextField.layer.borderColor = UIColor.black.cgColor
        loginTextField.layer.borderWidth = 2.0
        loginTextField.layer.cornerRadius = 10
        loginTextField.leftView = createPaddingView()
        loginTextField.leftViewMode = .always
        loginTextField.autocapitalizationType = .none
        loginTextField.autocorrectionType = .no
        //MARK: passwordTextField
        passwordTextField.placeholder = "ПАРОЛЬ"
        passwordTextField.clearButtonMode = .always
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 2.0
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.leftView = createPaddingView()
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocapitalizationType = .none
        passwordTextField.autocorrectionType = .no
        //MARK: rememberPasswordButton
        rememberPasswordButton.setTitle("Забыл логин или пароль", for: .normal)
        rememberPasswordButton.setTitleColor(.black, for: .normal)
        rememberPasswordButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        //MARK: authorizationBitton
        authorizationBitton.setTitle("АВТОРИЗОВАТЬСЯ", for: .normal)
        authorizationBitton.backgroundColor = customColorBackground
        authorizationBitton.titleLabel?.font = .boldSystemFont(ofSize: 28)
        authorizationBitton.setTitleColor(.black, for: .normal)
        authorizationBitton.layer.cornerRadius = 10
        authorizationBitton.layer.borderWidth = 2.0
        authorizationBitton.layer.borderColor = UIColor.black.cgColor
        authorizationBitton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        authorizationBitton.titleLabel?.adjustsFontSizeToFitWidth = true // Размер кнопки отталкиваеться от размера текста
        authorizationBitton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        //MARK: closeViewButton
        closeViewButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeViewButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeViewButton.tintColor = .black
    }
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    private func showAuthorizationAlertError() {
        let alert = UIAlertController(title: "ОШИБКА", message: "неправильный логин или пароль", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default , handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
extension AuthorizationView: UITextFieldDelegate {
    @objc func logIn() {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        if (!login.isEmpty && !password.isEmpty) {
            Auth.auth().signIn(withEmail: login, password: password) { result, error in
                if error == nil {
                    print("Авторизация прошла успешно")
                    let infoFilms = ViewController()
                    self.navigationController?.pushViewController(infoFilms, animated: true)
                    let navigationController = UINavigationController(rootViewController: infoFilms)
                                    self.view.window?.rootViewController = navigationController
                                    self.view.window?.makeKeyAndVisible()
                }else{
                    print("ошибка авторизации")
                    self.showAuthorizationAlertError()
                }
            }
        }else{
            self.showAuthorizationAlertError()
        }
    }
}
