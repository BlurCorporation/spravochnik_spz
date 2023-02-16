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
        static let system = UIColor(red: 1,
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
        // SavedCalcTableView
        static let savedCalcCellCornerRadius = CGFloat(16)
        static let littleStackViewSpacing = CGFloat(4)
        static let bigStackViewSpacing = CGFloat(32)
        static let costCornerRadius = CGFloat(18)
        static let costHeight = CGFloat(50)
        static let savedCalcHeaderHeight = CGFloat(80)
        static let widthHeader = CGFloat(263)
        static let textFieldHeight = CGFloat(50)
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
        static let forgotPassword = "Забыли пароль?"
    }
    
    enum PlaceHolders {
        static let name = "Имя"
        static let eMail = "Email"
        static let password = "Пароль"
        static let retypePassword = "Повторите пароль"
    }
    
    enum Constraints {
        static let sideOffset = CGFloat(16)
        static let bottomOffset = CGFloat(16)
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
        static let cellOffsets = CGFloat(20)
        // SavedCalcTableView
        static let topTableViewOffset = CGFloat(64)
        // SavedCalcTableHeader
        static let leadingHeaderOffset = CGFloat(16)
    }
    
    enum NavigationController {
        static let registerTitle = "Регистрация"
        static let authTitle = "Войти"
        static let authButtonHeight = CGFloat(50)
        static let commonStackViewTopOffset = CGFloat(24)
    }
    
    enum Fonts {
        // SavedCalculationsCells with sizes
        static let cellAddressLabel = UIFont(name: "HelveticaNeueCyr-Medium", size: 16)
        static let cellSystemLabel = UIFont(name: "HelveticaNeueCyr-Roman", size: 12)
        static let cellDateLabel = UIFont(name: "HelveticaNeueCyr-Light", size: 13)
        static let cellStagesLabel = UIFont(name: "HelveticaNeueCyr-Light", size: 13)
        static let cellCostLabel = UIFont(name: "HelveticaNeueCyr-Light", size: 13)
        // SavedCalculationsHeader
        static let savedCalcTitle = UIFont(name: "HelveticaNeueCyr-Bold", size: 30)
        // cap
        static let capFont = UIFont(name: "HelveticaNeueCyr-Bold", size: 17)
        static let smallCapFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 14)
        // start, auth
        static let infoWithLinksLabelFont = UIFont(name: "HelveticaNeueCyr-Light", size: 11)
        // onboarding, start, calculations, results
        static let infoLabelFont = UIFont(name: "HelveticaNeueCyr-Light", size: 13)
        // reset and change password
        static let infoPasswordFont = UIFont(name: "HelveticaNeueCyr-Medium", size: 12)
        // auth
        static let authLabelFont = UIFont(name: "HelveticaNeueCyr-Medium", size: 13)
        // main
        static let mainCellFont = UIFont(name: "HelveticaNeueCyr-Medium", size: 16)
        // titleNavBar
        static let titleNavBarFont = UIFont(name: "HelveticaNeueCyr-Medium", size: 17)
        // customAlert
        static let alertTitle = UIFont(name: "HelveticaNeueCyr-Medium", size: 18)
        // customTextFields
        static let textField = UIFont(name: "HelveticaNeueCyr-Roman", size: 15)
        // profile
        static let profileButtonFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 15)
        static let smallProfileButtonFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 13)
        // results tableView
        static let allSectionNumberFont = UIFont(name: "HelveticaNeueCyr-Medium", size: 17)
        static let firstSectionResultsFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 18)
        static let secondSectionResultsFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 15)
        static let thirdSectionTitleResultsFont = UIFont(name: "HelveticaNeueCyr-Medium", size: 18)
        static let thirdSectionResultsFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 15)
        // calculation tableView
        static let firstSectionCalculationFont = UIFont(name: "HelveticaNeueCyr-Roman", size: 18)
        static let secondSection = UIFont(name: "HelveticaNeueCyr-Medium", size: 15)
        // customButton
        static let customButtonFont = UIFont(name: "HelveticaNeueCyr-Bold", size: 17)
        // in sections tableView in results
        static let smallTableHeaderFont = UIFont(name: "HelveticaNeueCyr-Bold", size: 20)
        // onboarding
        static let onboardingTitleFont = UIFont(name: "HelveticaNeueCyr-Bold", size: 30)
        // tableView and username in profile
        static let bigTableHeaderFont = UIFont(name: "HelveticaNeueCyr-Bold", size: 30)
        // start
        static let applicationNameLabelFont = UIFont(name: "HelveticaNeueCyr-Bold", size: 34)
    }
}
