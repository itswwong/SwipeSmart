//
//  TabBarItem.swift
//  SwipeSmart
//
//  Created by Tyler Xiao on 11/23/24.
//

import Foundation
import SwiftUI
//struct TabBarItem:Hashable {
  //  let iconName:String
    //let title : String
    //let color:Color
//}
enum TabBarItem:Hashable{
    case Rewards, CreditCards
    var iconName:String{
        switch self {
        case.Rewards: return "dollarsign.square"
        case.CreditCards: return "creditcard"
        }
    }
    var title:String{
        switch self {
        case.Rewards: return "Rewards"
        case.CreditCards: return "Credit Cards"
        }
    }
    var color:Color{
        switch self {
        case.Rewards: return Color.gray
        case.CreditCards: return Color.gray
        }
    }
    
}

