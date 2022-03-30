//
//  LoginViewController.swift
//  Instargram-Clone
//
//  Created by 정덕호 on 2022/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - 속성
    private var viewModel = LoginViewModel()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Instagram_logo_white")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.loginAndReisterTextField(title: "  이메일")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.loginAndReisterTextField(title: "  비밀번호", isSecureTextEntry: true)
        return tf
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emailTextField,passwordTextField, loginButton,forgetPasswordButton])
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.loginAndReistterButton(title: "로그인")
        button.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        button.backgroundColor = .systemPurple.withAlphaComponent(0.2)
        button.setTitleColor(UIColor(white: 1, alpha: 0.2), for: .normal)
        button.isEnabled = false
        return button
    }()
    
    private let dontHaveButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(firstPart: "이메일이 없으신가요?", secondPart: "  회원가입 하기")
        button.addTarget(self, action: #selector(tapDontHaveButton), for: .touchUpInside)
        return button
    }()
    
    private let forgetPasswordButton: UIButton = {
       let button = UIButton()
        button.attributedTitle(firstPart: "비밀번호를 잃어버리셨나요?", secondPart: "  비밀번호찾기")
        button.addTarget(self, action: #selector(tapDontHaveButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - 라이프사이클

    override func viewDidLoad() {
        super.viewDidLoad()
         configureUI()
        configureNotificationObsrvers()
    }
    
    //MARK: - 도움메서드
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        gradient()
        
        hideKeyboardWhenTappedAround()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        view.addSubview(stackView)
        stackView.anchor(top: iconImage.bottomAnchor, left:  view.leftAnchor, right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(dontHaveButton)
        dontHaveButton.centerX(inView: view)
        dontHaveButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func configureNotificationObsrvers() {
        emailTextField.addTarget(self, action: #selector(textDidchange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidchange), for: .editingChanged)
    }

    //MARK: - 셀렉터
    
    @objc func tapDontHaveButton() {
        let controller = RegisterViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidchange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        unpdateForm()
    }
    
    @objc func loginButtonTap() {
    }
}


extension LoginViewController: FormViewModel {
    func unpdateForm() {
        loginButton.backgroundColor = viewModel.buttonOptionColor
        loginButton.setTitleColor(viewModel.buttonOptionTextColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsVaild
    }
}
