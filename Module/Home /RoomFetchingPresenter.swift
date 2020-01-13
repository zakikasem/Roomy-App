//
//  RoomFetchingPresenter.swift
//  Roomy
//
//  Created by zaki kasem on 12/20/19.
//  Copyright © 2019 zaki kasem. All rights reserved.
//

import Foundation
protocol RoomFetching {
    var RoomView : HomeView! {get set}
    
    func fetchRooms()
    func getRoomsCount() -> Int
    func getItem(atIndex: Int) -> RoomData
    func whenRowSelected(room : RoomData)
}

class RoomFetchingPresenter:RoomFetching {
    weak var RoomView: HomeView!
    let router : HomeRouter!
    
    init(RoomView : HomeView , router : HomeRouter ) {
        self.RoomView = RoomView
        self.router = router
    }
    
    
    private var rooms = [RoomData]()
    
    func fetchRooms() {
        NetworkManager.roomFetching { (rooms,error) in
            guard let myrooms = rooms else {return}
            
            self.rooms = myrooms
            self.RoomView.reloadData()
        }
    }
    func getRoomsCount() -> Int {
        return rooms.count
    }
    func getItem(atIndex: Int) -> RoomData {
        return rooms[atIndex]
    }
    func whenRowSelected (room: RoomData) {
        self.router.navigateToListingViewController(room: RoomData)
        
    }
    
    
}
