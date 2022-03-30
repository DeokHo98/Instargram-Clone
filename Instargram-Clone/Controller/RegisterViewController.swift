//
//  REGISTERViewController.swift
//  Instargram-Clone
//
//  Created by 정덕호 on 2022/03/22.
//

import UIKit

class RegisterViewController: UIViewController {

    
    //MARK: - 속성
    
    private var viewModel = RegisterViewModel()
    
    private let plusPhotoButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "plus_photo"), for: .normal)
        bt.tintColor = .white
        bt.addTarget(self, action: #selector(handlerProfileImage), for: .touchUpInside)
        return bt
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
    
    private let fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.loginAndReisterTextField(title: "  이름", isSecureTextEntry: false)
        tf.keyboardType = .default
        return tf
    }()
    
    private let userNameTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .default
        tf.loginAndReisterTextField(title: "  닉네임", isSecureTextEntry: false)
        return tf
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,fullNameTextField,userNameTextField,loginButton])
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.loginAndReistterButton(title: "회원가입")
        button.backgroundColor = .systemPurple.withAlphaComponent(0.2)
        button.setTitleColor(UIColor(white: 1, alpha: 0.2), for: .normal)
        button.isEnabled = false
        return button
    }()
    
    private let dontHaveButton: UIButton = {
        let button = UIButton()
        button.attributedTitle(firstPart: "이메일이 있으신가요?", secondPart: "  로그인 하기")
        button.addTarget(self, action: #selector(tapDontHaveButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confiureView()
        reigsterTextFieldObserve()
    }
    
    
    //MARK: - 도움메서드
    func confiureView() {
        gradient()
        
        hideKeyboardWhenTappedAround()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left:  view.leftAnchor, right: view.rightAnchor,paddingTop: 32,paddingLeft: 32,paddingRight: 32)
        
        view.addSubview(dontHaveButton)
        dontHaveButton.centerX(inView: view)
        dontHaveButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func reigsterTextFieldObserve() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    //MARK: - 셀렉터
    @objc func tapDontHaveButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else {
            viewModel.userNmae = sender.text
        }
        
        unpdateForm()
    }
    
    @objc func handlerProfileImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
}

//MARK: - 뷰 모델 프로토콜

extension RegisterViewController: FormViewModel {
    func unpdateForm() {
        loginButton.backgroundColor = viewModel.buttonOptionColor
        loginButton.setTitleColor(viewModel.buttonOptionTextColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsVaild
    }
}

//MARK: - 이미지 픽커 델리게이트

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {return}
        
        //버튼을 동그랗게 만들기
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        
        //테두리 속성
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        
        //이미지선택
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}
