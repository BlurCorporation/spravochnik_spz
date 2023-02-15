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
        static let onboarding1 = UIImage(named: "onboarding1") ?? UIImage()
        static let onboarding2 = UIImage(named: "onboarding2") ?? UIImage()
        static let onboarding3 = UIImage(named: "onboarding3") ?? UIImage()
        static let pgLineGray = UIImage(named: "pageLineGray") ?? UIImage()
        static let pgLineBlack = UIImage(named: "pageLineBlack") ?? UIImage()
    }
    
    enum Sizes {
        // Lines in Splash and Onboarding
        static let heightAllLine = CGFloat(3)
        static let widthGrayLine = CGFloat(20)
        static let widthBlackLine = CGFloat(30)
        static let cornerRadiusAllLine = CGFloat(1.5)
        static let spasingBetweenLine = CGFloat(5)
        static let applicationNameLabelFont = CGFloat(34)
        static let infoLabelFont = CGFloat(11)
    }
    
    public enum Fonts {
        static let onboardingFont1 = UIFont.boldSystemFont(ofSize: Constants.Sizes.applicationNameLabelFont)
        static let onboardingFont2 = UIFont.systemFont(ofSize: Constants.Sizes.infoLabelFont)
    }
    
    enum TextLabels {
        static let applicationNameLabelText = "Справочник СПЗ"
        static let infoApplicationLabelText = "Войдите в систему или зарегистрируйтесь, чтобы получить полный доступ к приложению с возможность сохранять и делиться произведенными расчетами"
        static let infoWithLinksLabelText = "Выполняя вход в приложение вы соглашаетесь с Условиями использования и Политикой конфиденциальности"
        
        static let onboarding11 = "Удобно и быстро"
        static let onboarding12 = "С помощью нашего приложения Вы сможете быстро и удобно произвести расчеты систем безопасности"
        static let onboarding21 = "Множество расчетов"
        static let onboarding22 = "Расчеты стоимости проектирования, технические расчеты систем безопасности, физические расчеты, технико-экономические расчеты"
        static let onboarding31 = "Добро пожаловать"
        static let onboarding32 = "Благодарим, что выбрали нас. Мы поможем Вам расчитать стоимость интересующих Вас систем безопасности"
    }
    
    enum TextButtons {
        static let loginButton = "Войти"
        static let registerButton = "Зарегистрироваться"
        static let onboardingNextButton = "Дальше"
        static let onboardingSkipButton = "Пропустить"
    }
    
    enum Constraints {
        static let sideOffset = CGFloat(20)
        static let lowerOffset = CGFloat(16)
        static let buttonsSpasing = CGFloat(8)
        static let labelsStackViewSpasing = CGFloat(8)
        static let authButtonHeight = CGFloat(50)
        static let commonStackViewTopOffset = CGFloat(24)
    }
}
