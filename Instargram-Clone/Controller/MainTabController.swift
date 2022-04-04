//
//  MainTapController.swift
//  Instargram-Clone
//
//  Created by 정덕호 on 2022/03/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK: - 라이프사이클
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    //MARK: - 도움메서드
    
    func configureViewController() {
        //탭바컨트롤러를 설정하는 메서드입니다.
        let layout = UICollectionViewFlowLayout()
        let feed = templatNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templatNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController() )
        
        let image = templatNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        
        let noti = templatNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())

        let profile = templatNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
        
        viewControllers = [feed, search, image, noti, profile]
        
        tabBar.tintColor = .black
        
        
    }
    
    //탭바 아이템 이미지, 선택이미지, 색깔 등을 설정하는 메서드입니다.
    func templatNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage

        nav.navigationBar.tintColor = .black
        return nav
        
    }
}
