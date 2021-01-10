//
//  ViewController.swift
//  TestAvito
//
//  Created by Виктория Воробьева on 06.01.2021.
//

import UIKit

class ViewController: UIViewController {

    private let noticeResources = NoticeResources()
    private var index: Int?
    private var serviceAlert = ""
    private var descriptionAlert = ""
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 7
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let closeIcon = UIImage(named: "CloseIconTemplate.pdf")
        imageView.image = closeIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 27.0)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(imageView)
        view.addSubview(label)
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setupButton()
        setupLabel()
        setupCollectionView()
        setupImage()
        
        tuneLabel()
        tuneButton()
        customizeButton()
    }
    
    private func setupImage() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 13).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupButton() {
        button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupLabel() {
        label.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -45).isActive = true
    }
    
    private func tuneLabel() {
        label.text = noticeResources.title
    }
    
    private func tuneButton() {
        button.setTitle(noticeResources.actionTitle, for: .normal)
        button.addTarget(self, action: #selector(customizeButton), for: .touchUpInside)
    }

    @objc func customizeButton() {
        if index != nil {
            let alert = UIAlertController(title: "\(serviceAlert)", message: "\(descriptionAlert)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Услуга не выбрана", message: "Продолжить без изменений?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/3)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noticeResources.list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        let notic = noticeResources.list[indexPath.item]
        cell.listEntity = notic
        cell.backgroundColor = #colorLiteral(red: 0.9475917583, green: 0.9475917583, blue: 0.9475917583, alpha: 1)
        cell.layer.cornerRadius = 7
        
        if (indexPath.item == index) {
            cell.choiceIV.image = UIImage(named: "checkmark")
        }else {
            cell.choiceIV.image = .none
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        let noticeResour = noticeResources.list[indexPath.item]
        if index == indexPath.item {
            cell.choiceIV.image = .none
            index = nil
            button.setTitle(noticeResources.actionTitle, for: .normal)
        }
        else {
            index = indexPath.item
            button.setTitle(noticeResources.selectedActionTitle, for: .normal)
        }
        serviceAlert = noticeResour.title
        descriptionAlert = noticeResour.price
        collectionView.reloadData()
    }
}

class CustomCell: UICollectionViewCell {

    var listEntity: ListEntity! {
        didSet {
            iconIV.parserImage(from: listEntity.icon.imageUrl)
            titleLabel.text = listEntity.title
//            descriptionLabel.text = listEntity.description
//            priceLabel.text = listEntity.price
        }
    }
    
    private let iconIV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 23.0)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   let choiceIV: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica", size: 17.0)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica-Bold", size: 22.0)
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
    }

    func setupIV() {
        iconIV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        iconIV.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        iconIV.widthAnchor.constraint(equalToConstant: 52).isActive = true
        iconIV.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: iconIV.rightAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: choiceIV.leftAnchor, constant: -10).isActive = true
    }
    
    func setupChoiceIV() {
        choiceIV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        choiceIV.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        choiceIV.widthAnchor.constraint(equalToConstant: 20).isActive = true
        choiceIV.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconIV.rightAnchor, constant: 10).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: iconIV.leftAnchor, constant: -10).isActive = true
    }
    
    func setupPriceLabel() {
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: iconIV.rightAnchor, constant: 10).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: choiceIV.leftAnchor, constant: -10).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





