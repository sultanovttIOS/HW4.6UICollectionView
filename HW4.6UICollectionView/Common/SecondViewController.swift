//
//  SecondViewController.swift
//  HW4.6UICollectionView
//
//  Created by Alisher Sultanov on 1/2/24.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource {
    
    
    private let vericalCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 25,
                                 height: 230)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0,
                                           bottom: 10, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.layer.cornerRadius = 16
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    private let arrayInfo: [Simple] = [Simple(imageName: "1", title: "Salad", recipes: "16.233 reciepes"),
                                       Simple(imageName: "2", title: "Burger", recipes: "12.432 reciepes"),
                                       Simple(imageName: "3", title: "Pizza", recipes: "23.421 reciepes"),
                                       Simple(imageName: "4", title: "Noodles", recipes: "31.322 reciepes"),
                                       Simple(imageName: "5", title: "Beef", recipes: "24.729 reciepes"),
                                       Simple(imageName: "6", title: "Chicken", recipes: "15.926 reciepes"),
                                       Simple(imageName: "7", title: "Sushi", recipes: "20.045 reciepes"),
                                       Simple(imageName: "8", title: "Rice", recipes: "18.324 reciepes"),
                                       Simple(imageName: "9", title: "Seafoode", recipes: "17.492 reciepes"),
                                       Simple(imageName: "10", title: "Cake", recipes: "15.670 reciepes"),
                                       Simple(imageName: "11", title: "Soup", recipes: "18.240 reciepes"),
                                       Simple(imageName: "12", title: "Bread", recipes: "13.467 reciepes")]
    
    private let searchButton = MakerView.shared.makerButton(title: "",
                                                            imageName: "search",
                                                            tintColor: .white,
                                                            backgroundColor: .clear,
                                                            cornerRadius: 0)
    
    private let horizontalCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40,
                                 height: 200)
        
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20,
                                           bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.layer.cornerRadius = 16
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private let sortLabel = MakerView.shared.makerLabel(text: "Sort by", font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .white, numberOfLines: 1)
    
    private let mostPopularButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = "Most Popular"
        configuration.image = UIImage(systemName: "arrow.up.arrow.down")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 5
        
        let button = UIButton(configuration: configuration)
        button.tintColor = .red
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Salad", style: .plain, target: nil, action: nil)
        
        horizontalCollectionView.dataSource = self
        vericalCollectionView.dataSource = self
        
        setupSearchBtn()
        setupHorizontalCV()
        setupSortLabel()
        setupMostPopularBtn()
        setupVerticalCV()
    }
    
    private func setupVerticalCV() {
        view.addSubview(vericalCollectionView)
        vericalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(sortLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalTo(view.snp.bottom).offset(-20)
        }
    }
    
    private func setupMostPopularBtn() {
        view.addSubview(mostPopularButton)
        mostPopularButton.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(15)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(19)
        }
    }
    
    private func setupSortLabel() {
        view.addSubview(sortLabel)
        sortLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.height.equalTo(19)
        }
    }
    
    private func setupHorizontalCV() {
        view.addSubview(horizontalCollectionView)
        horizontalCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()//.inset(20)
            make.height.equalTo(200)
        }
    }
    
    private func setupSearchBtn() {
        view.addSubview(searchButton)
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(62)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.height.width.equalTo(28)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizontalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
            cell.setCell(arrayInfo[indexPath.row].imageName,
                         title: arrayInfo[indexPath.row].title,
                         recipes: arrayInfo[indexPath.row].recipes)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.setCell(arrayInfo[indexPath.row].imageName,
                     title: arrayInfo[indexPath.row].title,
                     recipes: arrayInfo[indexPath.row].recipes)
        return cell
    }
}
