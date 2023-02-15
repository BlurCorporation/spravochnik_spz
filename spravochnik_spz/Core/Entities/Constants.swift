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
        static let clear = UIColor.clear
        static let noneBackground = UIColor.red
        
        // SavedCalculationsCells
        static let address = UIColor.white
        static let type = UIColor(red: 1,
                                  green: 1,
                                  blue: 0.996,
                                  alpha: 1)
        static let date = UIColor.white
        static let stages = UIColor.white
        static let cost = UIColor.white
        static let whiteCellColor = UIColor(red: 1,
                                            green: 1,
                                            blue: 0.996,
                                            alpha: 1)
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
        // SavedCalculationsCells
        static let date = UIImage(named: "DateImage") ?? UIImage()
        static let stage = UIImage(named: "StageImage") ?? UIImage()
        static let securityAlarmIcon = UIImage(named: "SecurityAlarmIcon") ?? UIImage()
        static let fireAlarmIcon = UIImage(named: "FireAlarmIcon") ?? UIImage()
        static let firePumpIcon = UIImage(named: "FirePumpIcon") ?? UIImage()
        static let moduleFirefightingIcon = UIImage(named: "ModuleFirefightingIcon") ?? UIImage()
        static let notificationIcon = UIImage(named: "NotificationIcon") ?? UIImage()
        static let perimetrAlarmIcon = UIImage(named: "PerimetrAlarmIcon") ?? UIImage()
        static let smokeExhaustIcon = UIImage(named: "SmokeExhaustIcon") ?? UIImage()
        static let blackBackground = UIImage(named: "BlackBackground") ?? UIImage()
        static let grayBackground = UIImage(named: "GrayBackground") ?? UIImage()
        static let brownBackground = UIImage(named: "BrownBackground") ?? UIImage()
    }
    
    enum Sizes {
        static let borderWidth = CGFloat(1)
        // Lines in Splash and Onboarding
        static let heightAllLine = CGFloat(3)
        static let widthGrayLine = CGFloat(20)
        static let widthBlackLine = CGFloat(30)
        static let cornerRadiusAllLine = CGFloat(1.5)
        static let spasingBetweenLine = CGFloat(5)
        static let applicationNameLabelFont = CGFloat(34)
        static let registerFont = CGFloat(14)
        static let infoLabelFont = CGFloat(11)
        // SavedCalcTableView
        static let savedCalcCellCornerRadius = CGFloat(16)
        static let littleStackViewSpacing = CGFloat(8)
        static let bigStackViewSpacing = CGFloat(32)
        static let costCornerRadius = CGFloat(18)
        static let costHeight = CGFloat(50)
        static let savedCalcHeaderHeight = CGFloat(80)
        static let widthHeader = CGFloat(263)
    }
    
    enum TextLabels {
        static let applicationNameLabelText = "Справочник СПЗ"
        static let infoApplicationLabelText = "Войдите в систему или зарегистрируйтесь, чтобы получить полный доступ к приложению с возможность сохранять и делиться произведенными расчетами"
        static let infoWithLinksLabelText = "Выполняя вход в приложение вы соглашаетесь с Условиями использования и Политикой конфиденциальности"
        static let infoRegisterBottomLabelText = "У вас уже есть аккаунт?"
        static let authLabelText = "Войти через"
        static let savedCalculationsTitleLabelText = "Сохраненные расчеты"
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
        // SavedCalculationsCells
        static let leadingOffset = CGFloat(20)
        static let trailingOffset = CGFloat(-20)
        static let topOffset = CGFloat(20)
        static let bottomOffset = CGFloat(-20)
        // SavedCalcTableView
        static let topTableViewOffset = CGFloat(64)
        // SavedCalcTableHeader
        static let leadingHeaderOffset = CGFloat(16)
    }
    
    enum NavigationController {
        static let registerTitle = "Регистрация"
        static let authButtonHeight = CGFloat(50)
        static let commonStackViewTopOffset = CGFloat(24)
    }
    
    enum Fonts {
        // SavedCalculationsCells with sizes
        static let address = UIFont(name: "HelveticaNeue-Medium", size: 16)
        static let type = UIFont.italicSystemFont(ofSize: 12)
        static let date = UIFont(name: "HelveticaNeue-Light", size: 13)
        static let stages = UIFont(name: "HelveticaNeue-Light", size: 13)
        static let cost = UIFont(name: "HelveticaNeue-Light", size: 13)
        // SavedCalculationsHeader
        static let savedCalcTitle = UIFont(name: "HelveticaNeue-Bold", size: 30)
    }
}
