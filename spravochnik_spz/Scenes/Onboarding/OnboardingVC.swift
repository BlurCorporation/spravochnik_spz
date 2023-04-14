////
////  OnboardingVC.swift
////  spravochnik_spz
////
////  Created by Natalia Shevaldina on 14.03.2023.
////
//
//import UIKit
//
//class OnboardingVC: UIViewController{
//
//    private let scrollView = UIScrollView()
//
//    private let pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.currentPageIndicatorTintColor = Constants.Colors.black
//        pageControl.pageIndicatorTintColor = Constants.Colors.grey
//        pageControl.preferredIndicatorImage = Constants.Images.pgLineGray
//        pageControl.currentPage = 0
//        pageControl.numberOfPages = 3
//        return pageControl
//    }()
//
//    let nextButton = CustomButton(mode: .black)
//    let skipButton = CustomButton(mode: .transparent)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        scrollView.delegate = self
//        pageControl.addTarget(self,
//                              action: #selector(pageControlDidChange),
//                              for: .valueChanged)
//        configure()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        navigationController?.isNavigationBarHidden = true
//
//    }
//
//    @objc private func pageControlDidChange(_ sender: UIPageControl) {
//        let current = sender.currentPage
//        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
//    }
//
//    func configure() {
//        scrollView.frame = view.frame
//        scrollView.isPagingEnabled = true
//        view.addSubview(scrollView)
//        view.addSubview(pageControl)
//        view.addSubview(nextButton)
//        view.addSubview(skipButton)
//
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        skipButton.translatesAutoresizingMaskIntoConstraints = false
//        nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor,
//                                             constant: -Constants.Constraints.sideOffset),
//
//            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
//                                                constant: Constants.Constraints.sideOffset),
//            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
//                                                 constant: -Constants.Constraints.sideOffset),
//            nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//            nextButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor,
//                                               constant: -Constants.Constraints.sideOffset),
//
//            skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
//                                               constant: -Constants.Constraints.sideOffset),
//            skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,
//                                                constant: Constants.Constraints.sideOffset),
//            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
//                                                 constant: -Constants.Constraints.sideOffset),
//            skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//            ])
////        pageControl.frame = CGRect(x: 10,
////                                   y: view.frame.size.height - 250,
////                                   width: view.frame.size.width - 40,
////                                   height: 70)
//
//        let titles = [Constants.TextLabels.onboarding11,
//                      Constants.TextLabels.onboarding21,
//                      Constants.TextLabels.onboarding31]
//
//        let texts = [Constants.TextLabels.onboarding12,
//                      Constants.TextLabels.onboarding22,
//                      Constants.TextLabels.onboarding32]
//
//
//
//        for pageNumber in 0...2 {
//            let pageView = UIView(frame: CGRect(x: CGFloat(pageNumber) * view.frame.size.width,
//                                                y: 0,
//                                                width: view.frame.size.width,
//                                                height: scrollView.frame.height))
//            pageView.backgroundColor = .yellow
//
//            let imageView = UIImageView()
//            let titleLabel = UILabel()
//            let textLabel = UILabel()
////            let nextButton = CustomButton(mode: .black)
////            let skipButton = CustomButton(mode: .transparent)
//
//            titleLabel.textAlignment = .center
//            titleLabel.font = Constants.Fonts.onboardingFont1
//            titleLabel.text = titles[pageNumber]
//
//            textLabel.textAlignment = .center
//            textLabel.numberOfLines = 0
//            textLabel.font = Constants.Fonts.onboardingFont2
//            textLabel.text = texts[pageNumber]
//
//            imageView.contentMode = .scaleToFill
//            switch pageNumber {
//            case 0: imageView.image = Constants.Images.onboarding1
//            case 1: imageView.image = Constants.Images.onboarding2
//            default: imageView.image = Constants.Images.onboarding3
//            }
//
//            nextButton.setTitle(Constants.TextButtons.onboardingNextButton, for: .normal)
//            skipButton.setTitle(Constants.TextButtons.onboardingSkipButton, for: .normal)
//
////            nextButton.tag = pageNumber + 1
////            skipButton.tag = pageNumber + 1
//
//            if pageNumber == 2 {
//                nextButton.setTitle(Constants.TextButtons.loginButton, for: .normal)
////                skipButton.tintColor = .systemBackground
//            }
//
////            nextButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//
//            scrollView.addSubview(pageView)
//            pageView.addSubview(imageView)
//            pageView.addSubview(titleLabel)
//            pageView.addSubview(textLabel)
////            pageView.addSubview(nextButton)
////            pageView.addSubview(skipButton)
//
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            textLabel.translatesAutoresizingMaskIntoConstraints = false
////            nextButton.translatesAutoresizingMaskIntoConstraints = false
////            skipButton.translatesAutoresizingMaskIntoConstraints = false
//
////            pageView.addSubviews(imageView, titleLabel, textLabel, nextButton, skipButton)
//
//            NSLayoutConstraint.activate([
//                imageView.topAnchor.constraint(equalTo: pageView.topAnchor),
//                imageView.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
//                imageView.widthAnchor.constraint(equalToConstant: pageView.frame.size.width),
//
//                titleLabel.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
//                titleLabel.centerYAnchor.constraint(equalTo: pageView.centerYAnchor),
//                titleLabel.leadingAnchor.constraint(equalTo: pageView.leadingAnchor,
//                                                    constant: Constants.Constraints.sideOffset),
//                titleLabel.trailingAnchor.constraint(equalTo: pageView.trailingAnchor,
//                                                     constant: -Constants.Constraints.sideOffset),
//
//                textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
//                                               constant: Constants.Constraints.sideOffset),
//                textLabel.leadingAnchor.constraint(equalTo: pageView.leadingAnchor,
//                                                   constant: Constants.Constraints.sideOffset),
//                textLabel.trailingAnchor.constraint(equalTo: pageView.trailingAnchor,
//                                                    constant: -Constants.Constraints.sideOffset),
//
//////                nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor,
//////                                                constant: Constants.Constraints.sideOffset),
////                nextButton.leadingAnchor.constraint(equalTo: pageView.leadingAnchor,
////                                                    constant: Constants.Constraints.sideOffset),
////                nextButton.trailingAnchor.constraint(equalTo: pageView.trailingAnchor,
////                                                    constant: -Constants.Constraints.sideOffset),
////                nextButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
////                nextButton.bottomAnchor.constraint(equalTo: skipButton.topAnchor,
////                                                constant: Constants.Constraints.sideOffset),
//////
////                skipButton.bottomAnchor.constraint(equalTo: pageView.bottomAnchor,
////                                                   constant: -Constants.Constraints.sideOffset),
////                skipButton.leadingAnchor.constraint(equalTo: pageView.leadingAnchor,
////                                                    constant: Constants.Constraints.sideOffset),
////                skipButton.trailingAnchor.constraint(equalTo: pageView.trailingAnchor,
////                                                    constant: -Constants.Constraints.sideOffset),
////                skipButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.authButtonHeight),
//            ])
//        }
//        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
//    }
//
//    @objc func didTapButton(_ button: UIButton) {
////        guard button.tag < 3 else {
////            Core.shared.setIsNotNewUser()
////            dismiss(animated: true, completion: nil)
////            return
////        }
//        scrollView.setContentOffset(CGPoint(x: Int(view.frame.size.width) * button.tag, y: 0), animated: true)
//    }
//}
//
//extension OnboardingVC: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        self.pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x / scrollView.frame.size.width)))
//    }
//}
