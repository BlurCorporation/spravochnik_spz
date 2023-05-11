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
        static let dark = #colorLiteral(red: 0.06380403787, green: 0.09624507278, blue: 0.12997365, alpha: 1)
        static let darkGray = #colorLiteral(red: 0.5958735943, green: 0.6070739031, blue: 0.6143226027, alpha: 1)
        static let lightGray = #colorLiteral(red: 0.8471679091, green: 0.8505566716, blue: 0.8537925482, alpha: 1)
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
        
        // Main and SavedCalc cells
        static let darkCellColor = #colorLiteral(red: 0.2431372549, green: 0.2392156863, blue: 0.2549019608, alpha: 1)
        static let grayCellColor = #colorLiteral(red: 0.5607843137, green: 0.5843137255, blue: 0.6156862745, alpha: 1)
        static let yellowCellColor = #colorLiteral(red: 0.8352941176, green: 0.6784313725, blue: 0.5098039216, alpha: 1)
    }
    
    enum Images {
        //Onboarding
        static let onboarding1 = UIImage(named: "onboarding1") ?? UIImage()
        static let onboarding2 = UIImage(named: "onboarding2") ?? UIImage()
        static let onboarding3 = UIImage(named: "onboarding3") ?? UIImage()
        static let pgLineGray = UIImage(named: "pgLineGray") ?? UIImage()
        // App
        static let logoImage = UIImage(named: "logo") ?? UIImage()
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
        // Profile
        static let logoutImage = UIImage(named: "logout") ?? UIImage()
        // Main
        static let helpImage = UIImage(named: "help") ?? UIImage()
        // Calculation
        static let checkBoxImage = UIImage(named: "checkbox")
        static let checkBoxTrueImage = UIImage(named: "checkboxTrue")
        static let quitButtom = UIImage(named: "quitButton")
        // Cap Views
        static let noInternet = UIImage(named: "noInternet") ?? UIImage()
        static let file = UIImage(named: "file") ?? UIImage()
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
        static let headerHeight = CGFloat(80)
        static let widthHeader = CGFloat(263)
        static let textFieldHeight = CGFloat(50)
        // CalculationTableView
        static let buttonInCellCornerRadius = CGFloat(8)
        static let calculationHeaderHeight = CGFloat(100)
        static let tableViewTopOffset = CGFloat(50)
    }
    
    enum alarmTypesText {
        static let securityAlarmText = "securityAlarmText".localized
        static let fireAlarmText = "fireAlarmText".localized
        static let firePumpText = "firePumpText".localized
        static let moduleFirefightingText = "moduleFirefightingText".localized
        static let notificationText = "notificationText".localized
        static let perimetrAlarmText = "perimetrAlarmText".localized
        static let smokeExhaustText = "smokeExhaustText".localized
    }
    
    enum TextLabels {
        static let applicationNameLabelText = "applicationNameLabelText".localized
        static let infoApplicationLabelText = "infoApplicationLabelText".localized
        static let infoWithLinksLabelText = "infoWithLinksLabelText".localized
        static let infoRegisterBottomLabelText = "infoRegisterBottomLabelText".localized
        static let infoAuthBottomLabelText = "infoAuthBottomLabelText".localized
        static let authLabelText = "authLabelText".localized
        static let savedCalculationsTitleLabelText = "savedCalculationsTitleLabelText".localized
        static let username = "username".localized
        static let infoPasswordLabelText = "infoPasswordLabelText".localized
        static let infoEmailLabelText = "infoEmailLabelText".localized
        static let mainHeaderLabelText = "mainHeaderLabelText".localized
        // Cap Views
        static let noInternetTitle = "noInternetTitle".localized
        static let noInternetText = "noInternetText".localized
        static let savedCalcTitle = "savedCalcTitle".localized
        static let savedCalcText = "savedCalcText".localized
        // Onboarding
        static let onboarding11 = "onboarding11".localized
        static let onboarding12 = "onboarding12".localized
        static let onboarding21 = "onboarding21".localized
        static let onboarding22 = "onboarding22".localized
        static let onboarding31 = "onboarding31".localized
        static let onboarding32 = "onboarding32".localized
    }
    
    enum TextButtons {
        static let appThemeButtonText = "appThemeButtonText".localized
        static let colorAppThemeButtonText = "colorAppThemeButtonText".localized
        static let updateDataButtonText = "updateDataButtonText".localized
        static let usingConditionsButtonText = "usingConditionsButtonText".localized
        static let privacyPolicyButtonText = "privacyPolicyButtonText".localized
        static let loginButton = "loginButton".localized
        static let registerButton = "registerButton".localized
        static let forgotPassword = "forgotPassword".localized
        static let resetPasswordButtonText = "resetPasswordButtonText".localized
        static let updatePasswordButtonText = "updatePasswordButtonText".localized
        static let changePasswordButtonText = "changePasswordButtonText".localized
        static let saveChangesButtonText = "saveChangesButtonText".localized
        static let calculationButtonText = "calculationButtonText".localized
        static let otherCalculationButtonText = "otherCalculationButtonText".localized
        static let onboardingNextButton = "onboardingNextButton".localized
        static let onboardingSkipButton = "onboardingSkipButton".localized
    }
    
    enum PlaceHolders {
        static let name = "name".localized
        static let eMail = "eMail".localized
        static let password = "password".localized
        static let retypePassword = "retypePassword".localized
        static let newPassword = "newPassword".localized
    }
    
    enum Constraints {
        static let sideOffset = CGFloat(16)
        static let bottomOffset = CGFloat(16)
        static let buttonsSpasing = CGFloat(8)
        static let labelsStackViewSpasing = CGFloat(8)
        static let buttonHeight = CGFloat(50)
        static let commonStartStackViewTopOffset = CGFloat(128)
        static let registerTextFieldStackViewHeight = CGFloat(224)
        static let registerLineViewHeight = CGFloat(1.5)
        static let registerTopStackViewTopOffset = CGFloat(50)
        static let registerMiddleStackViewSideOffset = CGFloat(48)
        static let commonStackViewTopOffset = CGFloat(32)
        // SavedCalculationsCells
        static let cellOffsets = CGFloat(20)
        // SavedCalcTableView
        static let topTableViewOffset = CGFloat(64)
        // SavedCalcTableHeader
        static let leadingHeaderOffset = CGFloat(16)
        // CapViews
        static let capImageSize = CGFloat(100)
    }
    
    enum NavigationController {
        static let registerTitle = "registerTitle".localized
        static let authTitle = "authTitle".localized
        static let resetPasswordTitle = "resetPasswordTitle".localized
        static let updatePasswordTitle = "updatePasswordTitle".localized
        static let updateDataTitle = "updateDataTitle".localized
        static let authButtonHeight = CGFloat(50)
        static let commonStackViewTopOffset = CGFloat(24)
    }
    
    enum Fonts {
        static let h1 = UIFont(name: "boldFont".localized, size: 34)
        static let h2 = UIFont(name: "boldFont".localized, size: 30)
        static let h3 = UIFont(name: "boldFont".localized, size: 20)
        static let h4 = UIFont(name: "mediumFont".localized, size: 17)
        static let h5 = UIFont(name: "boldFont".localized, size: 17)
        static let b1 = UIFont(name: "romanFont".localized, size: 18)
        static let b2 = UIFont(name: "romanFont".localized, size: 15)
        static let b3 = UIFont(name: "lightFont".localized, size: 13)
        static let b4 = UIFont(name: "romanFont".localized, size: 13)
        static let b5 = UIFont(name: "romanFont".localized, size: 12)
        static let b6 = UIFont(name: "lightFont".localized, size: 11)
        
        
        
        //SavedCalculationsHeader
//        static let savedCalcTitle = h2 = UIFont(name: "HelveticaNeueCyr-Bold", size: 30)
        
        // SavedCalculationsCells with sizes
//        static let cellAddressLabel = h4 = UIFont(name: "HelveticaNeueCyr-Medium", size: 17)
                
        // customAlert
//        static let alertTitle = h4 = UIFont(name: "HelveticaNeueCyr-Medium", size: 18)
        
        // profile
//        static let smallProfileButtonFont = b4 = UIFont(name: "HelveticaNeueCyr-Roman", size: 13)
        
        
        // results tableView
//        static let allSectionNumberFont = h4 = UIFont(name: "HelveticaNeueCyr-Medium", size: 17)
//        static let secondSectionResultsFont = b2 = UIFont(name: "HelveticaNeueCyr-Roman", size: 15)
//        static let thirdSectionTitleResultsFont = h4 = UIFont(name: "HelveticaNeueCyr-Medium", size: 18)
//        static let thirdSectionResultsFont = b2 = UIFont(name: "HelveticaNeueCyr-Roman", size: 15)
        
        
        // calculation tableView
//        static let firstSectionCalculationFont = b1 = UIFont(name: "HelveticaNeueCyr-Roman", size: 18)
        
        // in sections tableView in results
//        static let smallTableHeaderFont = h3 = UIFont(name: "HelveticaNeueCyr-Bold", size: 20)
        
    }
}
