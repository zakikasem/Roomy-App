//
//  HomeRouterImplementation.swift
//  Roomy
//
//  Created by zaki kasem on 1/12/20.
//  Copyright © 2020 zaki kasem. All rights reserved.
//

import Foundation
import UIKit
protocol HomeRouter {
    func navigateToListingViewController(room : RoomData)
}
class HomeRouterImplementation : HomeRouter {
    
    let homeViewController:HomeViewController!
    
    init(homeViewController:HomeViewController) {
        self.homeViewController = homeViewController
    }
    
    func navigateToListingViewController(room : RoomData) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listingViewController = storyBoard.instantiateViewController(identifier: "listingViewController") as! ListingViewController
        listingViewController.room = room
        homeViewController.navigationController?.pushViewController(listingViewController, animated: true)
    }
}

