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
    var listEntity: ListEntity!
    
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
    
    fileprivate let collectionView: UICollectionView = {
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
        if (index != nil)  {
            let alert = UIAlertController(title: "\(serviceAlert)", message: "\(descriptionAlert)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Услуга не выбрана", message: "Продолжить?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)

//        var size: CGSize = CGSize(width: 0, height: 0)
//        if (listEntity.description != nil) {
//            size = CGSize(width: collectionView.frame.width, height: 185)
//        }
//        else {
//            size = CGSize(width: collectionView.frame.width, height: 120)
//        }
//        return size
//        идея такая, если есть description ячейки одного размера, нет - другого. Мб конечно можно более изящно это сделать, но уже нет времени 
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
