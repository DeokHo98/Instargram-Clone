//
//  File.swift
//  Instargram-Clone
//
//  Created by 정덕호 on 2022/03/22.
//

import Foundation
import UIKit

protocol FormViewModel {
    func unpdateForm()
}

protocol AuthViewModel {
    var formIsVaild: Bool { get }
    var buttonOptionColor: UIColor { get }
    var buttonOptionTextColor: UIColor { get }
}

struct LoginViewModel: AuthViewModel {
    var email: String?
    var password: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false 
    }
    
    var buttonOptionColor: UIColor {
        return formIsVaild ? UIColor.systemPurple.withAlphaComponent(1) : UIColor.systemPurple.withAlphaComponent(0.2)
    }
    
    var buttonOptionTextColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.2)
    }
}


struct RegisterViewModel: AuthViewModel {
    
    var email: String?
    var password: String?
    var fullName: String?
    var userNmae: String?
   
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userNmae?.isEmpty == false
    }
    
    var buttonOptionColor: UIColor {
        return formIsVaild ? UIColor.systemPurple.withAlphaComponent(1) : UIColor.systemPurple.withAlphaComponent(0.2)
    }
    
    var buttonOptionTextColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.2)
    }

}


