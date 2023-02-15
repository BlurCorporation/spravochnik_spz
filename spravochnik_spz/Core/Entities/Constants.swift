//
//  Constants.swift
//  spravochnik_spz
//
//  Created by Natalia Shevaldina on 23.01.2023.
//

import UIKit

enum Constants {
    
    enum Colors {
        // Themes
        static let lightThemeBackground = UIColor.white
        static let darkThemeBackground = UIColor.black
        
        // App Colors
        static let black = UIColor.black
        static let grey = UIColor.gray
        static let lightGrey = UIColor.lightGray
    }
    
    enum Images {
        static let logo = UIImage(named: "logo") ?? UIImage()
        static let tabBarMain = UIImage(named: "TabBarMain") ?? UIImage()
        static let tabBarSaved = UIImage(named: "TabBarSaved") ?? UIImage()
        static let tabBarProfile = UIImage(named: "TabBarProfile") ?? UIImage()
        static let appleButtonImage = UIImage(named: "Apple") ?? UIImage()
        static let facebookButtonImage = UIImage(named: "Facebook") ?? UIImage()
        static let googleButtonImage = UIImage(named: "Google") ?? UIImage()
        static let backButtomImage = UIImage(named: "Back") ?? UIImage()
    }
    
    enum Sizes {
        // Lines in Splash and Onboarding
        static let heightAllLine = CGFloat(3)
        static let widthGrayLine = CGFloat(20)
        static let widthBlackLine = CGFloat(30)
        static let cornerRadiusAllLine = CGFloat(1.5)
        static let spasingBetweenLine = CGFloat(5)
        static let applicationNameLabelFont = CGFloat(34)
        static let registerFont = CGFloat(14)
        static let infoLabelFont = CGFloat(11)
    }
    
    enum TextLabels {
        static let applicationNameLabelText = "Справочник СПЗ"
        static let infoApplicationLabelText = "Войдите в систему или зарегистрируйтесь, чтобы получить полный доступ к приложению с возможность сохранять и делиться произведенными расчетами"
        static let infoWithLinksLabelText = "Выполняя вход в приложение вы соглашаетесь с Условиями использования и Политикой конфиденциальности"
        static let infoRegisterBottomLabelText = "У вас уже есть аккаунт?"
        static let authLabelText = "Войти через"
    }
    
    enum TextButtons {
        static let loginButton = "Войти"
        static let registerButton = "Зарегистрироваться"
    }
    
    enum PlaceHolders {
        static let name = "Имя"
        static let eMail = "Email"
        static let password = "Пароль"
        static let retypePassword = "Повторите пароль"
    }
    
    enum Constraints {
        static let sideOffset = CGFloat(16)
        static let lowerOffset = CGFloat(16)
        static let buttonsSpasing = CGFloat(8)
        static let labelsStackViewSpasing = CGFloat(8)
        static let buttonHeight = CGFloat(50)
        static let commonStackViewTopOffset = CGFloat(128)
        static let registerTextFieldStackViewHeight = CGFloat(224)
        static let registerLineViewHeight = CGFloat(1.5)
        static let registerTopStackViewTopOffset = CGFloat(50)
        static let registerMiddleStackViewSideOffset = CGFloat(48)
        static let registerMiddleStackViewTopOffset = CGFloat(32)
    }
    
    enum NavigationController {
        static let registerTitle = "Регистрация"
    }
}
