//
//  ViewController.swift
//  AutolayoutTraining
//
//  Created by Дмитро Волоховський on 30/01/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView : UIImageView = {
        let imageView = UIImageView(image:UIImage(named: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let descriptionTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n \n \n Are you ready for loads and loads of fun? Don't wait any longer! We Hope to see you in our stores soon! ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSMutableAttributedString.Key.foregroundColor : UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let pageControl : UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomControlls()
    }
    private func setupLayout(){
        // Top part setUp
        let topImagecontainerView = UIView()
        view.addSubview(topImagecontainerView)
        topImagecontainerView.translatesAutoresizingMaskIntoConstraints = false
        topImagecontainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImagecontainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImagecontainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImagecontainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImagecontainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImagecontainerView.addSubview(bearImageView)
        //Image View constraints
        bearImageView.centerXAnchor.constraint(equalTo: topImagecontainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImagecontainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImagecontainerView.heightAnchor, multiplier: 0.6).isActive = true
        // Text View constraints
        descriptionTextView.topAnchor.constraint(equalTo: topImagecontainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    func setupBottomControlls() {
        let botttomControllsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        botttomControllsStackView.translatesAutoresizingMaskIntoConstraints = false
        botttomControllsStackView.distribution = .fillEqually
        view.addSubview(botttomControllsStackView)
        NSLayoutConstraint.activate([
            botttomControllsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            botttomControllsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            botttomControllsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            botttomControllsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

