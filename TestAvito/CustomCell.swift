//
//  CustomCell.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 07.01.2021.
//

import UIKit

class CustomCell: UICollectionViewCell {

    var listEntity: ListEntity! {
        didSet {
            iconIV.parserImage(from: listEntity.icon.imageUrl)
            titleLabel.text = listEntity.title
            descriptionLabel.text = listEntity.description
            priceLabel.text = listEntity.price
        }
    }
    
    private let iconIV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 19.0)
//        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   let choiceIV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica", size: 17.0)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
            super.init(frame: .zero)

        contentView.addSubview(iconIV)
        contentView.addSubview(titleLabel)
        contentView.addSubview(choiceIV)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)

        setupIV()
        setupChoiceIV()
        setupChoiceIV()
        setupDescriptionLabel()
        setupPriceLabel()
        setupTitleLabel()
    }

    func setupIV() {
//        iconIV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
//        iconIV.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
//        iconIV.widthAnchor.constraint(equalToConstant: 52).isActive = true
//        iconIV.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        iconIV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        iconIV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        iconIV.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: iconIV.rightAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: choiceIV.leftAnchor, constant: -10).isActive = true
        
//        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: iconIV.trailingAnchor, constant: 10).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
    }
    
    func setupChoiceIV() {
        choiceIV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        choiceIV.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        choiceIV.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.leadingAnchor.constraint(equalTo: iconIV.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        
//        descriptionLabel.leadingAnchor.constraint(equalTo: iconIV.trailingAnchor, constant: 10).isActive = true
//        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
//        descriptionLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
    }
    
    func setupPriceLabel() {
//        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
//        priceLabel.leftAnchor.constraint(equalTo: iconIV.rightAnchor, constant: 10).isActive = true
//        priceLabel.rightAnchor.constraint(equalTo: choiceIV.leftAnchor, constant: -10).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
