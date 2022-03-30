//
//  FeedCell.swift
//  Instargram-Clone
//
//  Created by 정덕호 on 2022/03/22.
//

import UIKit

class FeedCell: UICollectionViewCell {

    static let identifier = "FeedCell"
    
    //MARK: - 속성
    
    private let profileImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private lazy var  usernameButton: UIButton = {
       let bt = UIButton()
        bt.setTitle("베놈", for: .normal)
        bt.setTitleColor(.black, for: .normal)
        bt.titleLabel?.font = .boldSystemFont(ofSize: 13)
        bt.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return bt
    }()
    
    private let postImageView: UIImageView  = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private lazy var commentButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "comment"), for: .normal)
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return bt
    }()
    
    private lazy var shareButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "send2"), for: .normal)
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return bt
    }()
    
    private lazy var likeButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "like_unselected"), for: .normal)
        bt.tintColor = .black
        bt.addTarget(self, action: #selector(didTapUserName), for: .touchUpInside)
        return bt
    }()
    
    private let likesLabel: UILabel = {
       let lb = UILabel()
        lb.text = "1 좋아요"
        lb.font = .boldSystemFont(ofSize: 13)
        return lb
    }()
    
    private let captionLabel: UILabel = {
       let lb = UILabel()
        lb.text = "내용은 무슨 내용을 넣어야할까요...."
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    private let postTimeLabel: UILabel = {
       let lb = UILabel()
        lb.text = "2일 전"
        lb.font = .boldSystemFont(ofSize: 12)
        lb.textColor = .lightGray
        return lb
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
        
    }()
    //MARK: - 라이프사이클
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12,paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        addSubview(stackView)
        stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
        
        addSubview(likesLabel)
        likesLabel.anchor(top: stackView.bottomAnchor,left: leftAnchor,paddingTop: -4,paddingLeft: 8)
        
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 8)
        
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor,left: leftAnchor,paddingTop: 8,paddingLeft: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - 셀렉터
    
    @objc func didTapUserName() {
        print("12312312")
    }
    

}
