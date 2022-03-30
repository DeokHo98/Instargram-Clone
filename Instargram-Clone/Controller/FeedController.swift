//
//  FeedController.swift
//  Instargram-Clone
//
//  Created by 정덕호 on 2022/03/22.
//

import UIKit

class FeedController: UICollectionViewController {
    
    //MARK: - 라이프사이클
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.identifier)
    }
    
    //MARK: - 도움 메서드
    
    func configureUI() {
        view.backgroundColor = .white
    }
}

//MARK: - 컬렉션뷰 데이터소스

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else {return UICollectionViewCell()}
        return cell
    }
}

//MARK: - 컬렉션뷰 레이아웃
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        let height = width + 8 + 40 + 8 + 50 + 60
        
        return CGSize(width: width, height: height)
    }
    
}
