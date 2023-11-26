//
//  HomeScreenViewController.swift
//  URLSessionApi
//
//  Created by User on 21.09.2023.
//

import UIKit
import SnapKit
import Firebase

class HomeScreenViewController: UIViewController {
    let customColorBackground = UIColor(named: "FonColor")
    let customColorButton = UIColor(named: "ButtonColor")
    let guestButton = UIButton()
    let authorizationButton = UIButton()
    let registrationButton = UIButton()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = customColorBackground
        setupe()
    }
    private func setupe() {
        view.addSubview(guestButton)
        view.addSubview(authorizationButton)
        view.addSubview(registrationButton)
        constraints()
        settingButton()
    }
    private func constraints() {
        guestButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(250)
            make.bottom.equalToSuperview().inset(550)
        }
        authorizationButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(guestButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(430)
        }
        registrationButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(authorizationButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(320)
        }
    }
    private func settingButton() {
        //MARK: guestButton
        guestButton.setTitle("Войти как гость", for: .normal)
        guestButton.backgroundColor = customColorButton
        guestButton.layer.cornerRadius = 10
        guestButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        guestButton.setTitleColor(.black, for: .normal)
        guestButton.addTarget(self, action: #selector(openViewInfoFilms), for: .touchUpInside)
        //MARK: authorizationButton
        authorizationButton.setTitle("Войти по логину и паролю", for: .normal)
        authorizationButton.backgroundColor = customColorButton
        authorizationButton.layer.cornerRadius = 10
        authorizationButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        authorizationButton.setTitleColor(.black, for: .normal)
        authorizationButton.addTarget(self, action: #selector(openViewAuthorization), for: .touchUpInside)
        //MARK: registrationButton
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.backgroundColor = customColorButton
        registrationButton.layer.cornerRadius = 10
        registrationButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        registrationButton.setTitleColor(.black, for: .normal)
        registrationButton.addTarget(self, action: #selector(openViewRegistration), for: .touchUpInside)
    }
    @objc func openViewAuthorization() {
        let authorizationView = AuthorizationView()
        present(authorizationView, animated: true, completion: nil)
    }
    @objc func openViewRegistration() {
        let regictrationView = RegistrationViewController()
        present(regictrationView, animated: true, completion: nil)
        
    }
    @objc func openViewInfoFilms() {
        Auth.auth().signInAnonymously { result, error in
            if error == nil {
                print("пользователь вошел как гость")
                let viewController = ViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            }else{
                print("Ошибка входа как гость")
            }
        }
        
    }
    
}
