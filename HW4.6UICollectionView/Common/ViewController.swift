//
//  ViewController.swift
//  HW4.6UICollectionView
//
//  Created by Alisher Sultanov on 31/1/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    private let nextButton = MakerView.shared.makerButton(title: "NextPage", imageName: nil, tintColor: .white,
                                                          backgroundColor: .orange, cornerRadius: 12)
    
    private let infoArray: [Simple] = [Simple(imageName: "1", title: "Salad", recipes: "16.233 reciepes"),
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
    
    private let searchBtn = MakerView.shared.makerButton(imageName: "search", tintColor: .white,
                                                         backgroundColor: .clear, cornerRadius: 0)
    
    private let simpleCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 25,
                                 height: 100)
        
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        configureNavigationBar()
        simpleCollectionView.dataSource = self
        simpleCollectionView.register(CustomCollectionViewCell.self,
                                      forCellWithReuseIdentifier: "cell")
        setupNextButton()
        setupSearchBtn()
        setupSimpleCV()
    }
    
    private func setupNextButton() {
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            //make.top.equalTo(simpleCollectionView.snp.bottom).offset(10)
            //make.horizontalEdges.equalToSuperview().inset(100)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(30)
        }
        nextButton.addTarget(self, action: #selector(goNextPage), for: .touchUpInside)
    }
    @objc func goNextPage(_ sender: UIButton) {
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    private func setupSimpleCV() {
        view.addSubview(simpleCollectionView)
        simpleCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBtn.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-10)
        }
    }
    
    private func setupSearchBtn() {
        view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(62)
            make.trailing.equalTo(view.snp.trailing).offset(-24)
            make.height.width.equalTo(28)
        }
    }
    
    private func configureNavigationBar() {
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "arrowLeft")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrowLeft")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Salad", style: .plain, target: nil, action: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        infoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.setCell(infoArray[indexPath.row].imageName,
                     title: infoArray[indexPath.row].title,
                     recipes: infoArray[indexPath.row].recipes)
        return cell
    }
}

