//
//  ViewController.swift
//  UIKit_Example
//
//  Created by 윤지호 on 2023/07/17.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel: HomeViewModel = HomeViewModel()
    
    //scrollView
    let scrollView = UIScrollView()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshView(_:)), for: UIRefreshControl.Event.valueChanged)
        refreshControl.backgroundColor = UIColor().mainColor
        return refreshControl
    }()
    
    // scrollView - UIStackView
    let searchVCView = UIView()
    let searchVCButton = UIButton()
    
    // scrollView - UIStackView
    let recommendScrollView = UIScrollView()
    let recommendStackView = UIStackView()
    
    let oneDeliveryButton = UIButton()
    let nomalDeliveryButton = UIButton()
    let packagingButton = UIButton()
    let bMartButton = UIButton()
    let freshButton = UIButton()
    let beaminStoreButton = UIButton()
    
    // scrollView - UIViews
    let firstButtonsScrollView = UIScrollView()
    let firstButtonsStackView = UIStackView()

    let testView = UIView()
    
    
    //toolBar
    let bottomView = UIView()
    let refrechButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backGroundColor")
        setNavigationController()
        
        addView()
        setViewProperties()
        setLayout()
    }
    
    func addView() {
        //view
        self.view.addSubview(bottomView)
        self.view.addSubview(scrollView)
        self.view.addSubview(refrechButton)
        
        //scrollview
        scrollView.addSubview(refreshControl)
        
        scrollView.addSubview(searchVCView)
        searchVCView.addSubview(searchVCButton)
        
        scrollView.addSubview(recommendScrollView)
        recommendScrollView.addSubview(recommendStackView)
        
        scrollView.addSubview(oneDeliveryButton)
        scrollView.addSubview(nomalDeliveryButton)
        scrollView.addSubview(packagingButton)
        scrollView.addSubview(bMartButton)
        
        
        
        scrollView.addSubview(freshButton)
        scrollView.addSubview(beaminStoreButton)
        
        scrollView.addSubview(firstButtonsScrollView)
        firstButtonsScrollView.addSubview(firstButtonsStackView)
        scrollView.addSubview(testView)
        
        
    }
    
    func setViewProperties() {
        
        //bottomView
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 10
        bottomView.layer.borderColor = UIColor.black.cgColor
        bottomView.layer.borderWidth = 2
        
        let size = 0.5 * (self.view.bounds.width / 5 - 10)
        
        refrechButton.backgroundColor = UIColor().mainColor
        refrechButton.layer.cornerRadius = size
        refrechButton.layer.borderColor = UIColor.black.cgColor
        refrechButton.layer.borderWidth = 2
        
        //scrollView
//        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height * 2)
        
        // searchVCView
        searchVCView.backgroundColor = UIColor().mainColor
        searchVCView.layer.cornerRadius = 10

        // seatchVCButton
        searchVCButton.addTarget(self, action: #selector(pushView), for: .touchUpInside)
        searchVCButton.backgroundColor = .white
        
        // recommendScrollView
        // recommendStackView
        recommendStackView.axis = .horizontal
        recommendStackView.spacing = 5
        
        // oneDeliveryButton
        oneDeliveryButton.layer.cornerRadius = 10
        oneDeliveryButton.backgroundColor = .gray
        oneDeliveryButton.setTitle("배민원", for: .normal)
        
        // nomalDeliveryButton
        nomalDeliveryButton.layer.cornerRadius = 10
        nomalDeliveryButton.backgroundColor = .gray
        nomalDeliveryButton.setTitle("배달", for: .normal)
        
        // packagingButton
        packagingButton.layer.cornerRadius = 10
        packagingButton.backgroundColor = .gray
        packagingButton.setTitle("포장", for: .normal)
        
        // bMartButton
        bMartButton.layer.cornerRadius = 10
        bMartButton.backgroundColor = .gray
        bMartButton.setTitle("BMart", for: .normal)
        
        // freshButton
        freshButton.layer.cornerRadius = 10
        freshButton.backgroundColor = .gray
        freshButton.setTitle("신선관", for: .normal)
        
        // beaminStoreButton
        beaminStoreButton.layer.cornerRadius = 10
        beaminStoreButton.backgroundColor = .gray
        beaminStoreButton.setTitle("배달", for: .normal)
        
        // firstButtonsStackView
        firstButtonsStackView.axis = .horizontal
        firstButtonsStackView.spacing = 10
        addFirstButtons()
        
        //testView
        testView.backgroundColor = .gray
    }
    
    func setLayout() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        refrechButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        searchVCView.translatesAutoresizingMaskIntoConstraints = false
        searchVCButton.translatesAutoresizingMaskIntoConstraints = false
        recommendScrollView.translatesAutoresizingMaskIntoConstraints = false
        recommendStackView.translatesAutoresizingMaskIntoConstraints = false
        oneDeliveryButton.translatesAutoresizingMaskIntoConstraints = false
        nomalDeliveryButton.translatesAutoresizingMaskIntoConstraints = false
        testView.translatesAutoresizingMaskIntoConstraints = false
        packagingButton.translatesAutoresizingMaskIntoConstraints = false
        bMartButton.translatesAutoresizingMaskIntoConstraints = false
        freshButton.translatesAutoresizingMaskIntoConstraints = false
        beaminStoreButton.translatesAutoresizingMaskIntoConstraints = false
        firstButtonsScrollView.translatesAutoresizingMaskIntoConstraints = false
        firstButtonsStackView.translatesAutoresizingMaskIntoConstraints = false

        
        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            // bottomView
            bottomView.heightAnchor.constraint(equalToConstant: 70),
            bottomView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            // bottomView - refrechButton
            refrechButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            refrechButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor, constant: -15),
            refrechButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.2, constant: -10),
            refrechButton.heightAnchor.constraint(equalTo: refrechButton.widthAnchor),
            
            // scrollView
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            // scrollView - searchVCView
            searchVCView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -60),
            searchVCView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            searchVCView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            searchVCView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: 60),
            
            // scrollView - searchVCView - searchVCButton
            searchVCButton.heightAnchor.constraint(equalToConstant: 40),
            searchVCButton.leadingAnchor.constraint(equalTo: searchVCView.leadingAnchor, constant: 20),
            searchVCButton.trailingAnchor.constraint(equalTo: searchVCView.trailingAnchor, constant: -20),
            searchVCButton.bottomAnchor.constraint(equalTo: searchVCView.bottomAnchor, constant: -15),
            
            // scrollView - recommendScrollView
            recommendScrollView.topAnchor.constraint(equalTo: searchVCView.bottomAnchor, constant: 10),
            recommendScrollView.heightAnchor.constraint(equalToConstant: 30),
            recommendScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            recommendScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            // scrollView - recommendScrollView - recommendStackView
            recommendStackView.leadingAnchor.constraint(equalTo: recommendScrollView.contentLayoutGuide.leadingAnchor),
            recommendStackView.trailingAnchor.constraint(equalTo: recommendScrollView.contentLayoutGuide.trailingAnchor),
            recommendStackView.topAnchor.constraint(equalTo: recommendScrollView.contentLayoutGuide.topAnchor),
            recommendStackView.bottomAnchor.constraint(equalTo: recommendScrollView.contentLayoutGuide.bottomAnchor),
            
            
            // scrollView - oneDeliveryButton
            oneDeliveryButton.topAnchor.constraint(equalTo: recommendScrollView.bottomAnchor, constant: 10),
            oneDeliveryButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 10),
            oneDeliveryButton.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 10),
            oneDeliveryButton.heightAnchor.constraint(equalToConstant: 200),

            // scrollView - nomalDeliveryButton
            nomalDeliveryButton.topAnchor.constraint(equalTo: recommendScrollView.bottomAnchor, constant: 10),
            nomalDeliveryButton.leadingAnchor.constraint(equalTo: oneDeliveryButton.trailingAnchor, constant: 10),
            nomalDeliveryButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            nomalDeliveryButton.widthAnchor.constraint(equalTo: oneDeliveryButton.widthAnchor),
            nomalDeliveryButton.heightAnchor.constraint(equalTo: oneDeliveryButton.heightAnchor),
            
            // scrollView - packagingButton
            packagingButton.topAnchor.constraint(equalTo: oneDeliveryButton.bottomAnchor, constant: 10),
            packagingButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            packagingButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            packagingButton.heightAnchor.constraint(equalToConstant: 80),
            
            // scrollView - bMartButton
            bMartButton.topAnchor.constraint(equalTo: packagingButton.bottomAnchor, constant: 10),
            bMartButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 10),
            bMartButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            bMartButton.heightAnchor.constraint(equalToConstant: 100),
            
            
            // scrollView - freshButton
            freshButton.topAnchor.constraint(equalTo: packagingButton.bottomAnchor, constant: 10),
            freshButton.leadingAnchor.constraint(equalTo: bMartButton.trailingAnchor, constant: 10),
            freshButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            freshButton.heightAnchor.constraint(equalToConstant: 100),
            freshButton.widthAnchor.constraint(equalTo: bMartButton.widthAnchor),
            
            // scrollView - beaminStoreButton
            beaminStoreButton.topAnchor.constraint(equalTo: bMartButton.bottomAnchor, constant: 10),
            beaminStoreButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            beaminStoreButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            beaminStoreButton.heightAnchor.constraint(equalToConstant: 90),
            
            // scrollView - firstButtonsScrollView
            firstButtonsScrollView.topAnchor.constraint(equalTo: beaminStoreButton.bottomAnchor, constant: 10),
            firstButtonsScrollView.heightAnchor.constraint(equalToConstant: 80),
            firstButtonsScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            firstButtonsScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            // scrollView - firstButtonsScrollView - firstButtonsStackView
            firstButtonsStackView.topAnchor.constraint(equalTo: firstButtonsScrollView.contentLayoutGuide.topAnchor),
            firstButtonsStackView.leadingAnchor.constraint(equalTo: firstButtonsScrollView.contentLayoutGuide.leadingAnchor),
            firstButtonsStackView.trailingAnchor.constraint(equalTo: firstButtonsScrollView.contentLayoutGuide.trailingAnchor),
            firstButtonsStackView.bottomAnchor.constraint(equalTo: firstButtonsScrollView.contentLayoutGuide.bottomAnchor),
            
            
            //testView
            testView.topAnchor.constraint(equalTo: firstButtonsScrollView.bottomAnchor, constant: 10),
            testView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            testView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            testView.heightAnchor.constraint(equalToConstant: 1000),
            testView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
        addRecommendButtons()

    }
}

extension HomeViewController {
    func setNavigationController() {
        self.navigationController?.navigationBar.backgroundColor = UIColor().mainColor
        
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.backgroundColor = UIColor().mainColor
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.standardAppearance = navigationAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
        
        
        let titleButton = UIBarButtonItem(title: "관악구 봉천동", style: .plain, target: self, action: #selector(pushView))
        titleButton.tintColor = .white
        self.navigationItem.leftBarButtonItem = titleButton


    }
    
    func addRecommendButtons() {
        for recommend in viewModel.recommendMenus {
            let button = UIButton()
            button.setTitle(recommend.name, for: .normal)
            button.setTitleColor(.black, for: .normal)
            
            if recommend.isSpecial {
                button.layer.cornerRadius = 16
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor().mainColor.cgColor
//                let gradientLayer = CAGradientLayer()
//                gradientLayer.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor().mainColor.cgColor]
//
//                button.layer.borderColor = gradientLayer.borderColor
//                button.layer.borderWidth = 2
//                button.layer.bor
//                button.layer.cornerRadius = 16
            } else {
                button.layer.cornerRadius = 16
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor().mainColor.cgColor
            }
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
            
            recommendStackView.addArrangedSubview(button)
        }
    }
    
    func addFirstButtons() {
        for item in viewModel.firstRecommends {
            let button = UIButton()
            
            button.setTitle(item, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .gray
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.heightAnchor.constraint(equalToConstant: 80).isActive = true
            button.widthAnchor.constraint(equalToConstant: 90).isActive = true
            
            firstButtonsStackView.addArrangedSubview(button)
        }

    }
    
    
    @objc func pushView() {
        let nextVC = SearchViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func refreshView(_ refreshControl: UIRefreshControl) {
        print("refresh")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            refreshControl.endRefreshing()
            print("refresh finished")
        })
    }
    
}
