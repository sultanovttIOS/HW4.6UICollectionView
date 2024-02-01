//
//  CustomCollectionViewCell.swift
//  HW4.6UICollectionView
//
//  Created by Alisher Sultanov on 31/1/24.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private let photoIV = MakerView.shared.makerImageView(imageName: "", cornerRadius: 16)
    
    private let titleLabel = MakerView.shared.makerLabel(text: "", font: UIFont.systemFont(ofSize: 16, weight: .semibold), textColor: .white, numberOfLines: 1)
    
    private let recipesLabel = MakerView.shared.makerLabel(text: "", font: UIFont.systemFont(ofSize: 13, weight: .regular), textColor: .systemBackground, numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        contentView.backgroundColor = .green
        contentView.layer.cornerRadius = 16
        setupPhotoIV()
        setupReciepesLabel()
        setupTitleLabel()
    }
    
    private func setupPhotoIV() {
        contentView.addSubview(photoIV)
//        photoIV.backgroundColor = .gray
//        photoIV.layer.cornerRadius = 16
        photoIV.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(recipesLabel.snp.top)
            make.leading.equalTo(recipesLabel.snp.leading)
            make.height.equalTo(18)
        }
    }
    
    private func setupReciepesLabel() {
        contentView.addSubview(recipesLabel)
        recipesLabel.snp.makeConstraints { make in
            make.bottom.equalTo(photoIV.snp.bottom).offset(-5)
            make.leading.equalTo(photoIV.snp.leading).offset(8)
            make.height.equalTo(15)
        }
    }
    
    func setCell(_ imageName: String, title: String, recipes: String) {
        photoIV.image = UIImage(named: imageName)
        titleLabel.text = title
        recipesLabel.text = recipes
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
