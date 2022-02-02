//
//  PageCell.swift
//  AutolayoutTraining
//
//  Created by Дмитро Волоховський on 01/02/2022.
//

import UIKit

class PageCell: UICollectionViewCell {
    //MARK: - Cell content arrangement
    let bearImageView : UIImageView = {
        let imageView = UIImageView(image:UIImage(named: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let descriptionTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    var page : Page?{
        didSet{
            guard let unwrappedPage = page else {return}
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n \n \n \(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSMutableAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  //MARK: - Setting Up The UI Layout 
    private func setupLayout(){
        // Top part setUp
        let topImagecontainerView = UIView()
        addSubview(topImagecontainerView)
        topImagecontainerView.translatesAutoresizingMaskIntoConstraints = false
        topImagecontainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImagecontainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImagecontainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImagecontainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImagecontainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImagecontainerView.addSubview(bearImageView)
        //Image View constraints
        bearImageView.centerXAnchor.constraint(equalTo: topImagecontainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImagecontainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImagecontainerView.heightAnchor, multiplier: 0.6).isActive = true
        // Text View constraints
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImagecontainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
