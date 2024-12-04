//
//  TabBarItem.swift
//  SwipeSmart
//
//  Created by Tyler Xiao on 11/23/24.
//

import Foundation
import SwiftUI

enum TabBarItem:Hashable {
    case Rewards, CreditCards
    var iconName:String {
        switch self {
        case.Rewards: return "dollarsign"
        case.CreditCards: return "creditcard"
        }
    }
    var title:String {
        switch self {
        case.Rewards: return "Rewards"
        case.CreditCards: return "Credit Cards"
        }
    }
    var color:Color {
        switch self {
        case.Rewards: return Color("tabbar")
        case.CreditCards: return Color("tabbar")
        }
    }
    
}
