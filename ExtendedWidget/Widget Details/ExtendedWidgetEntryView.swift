//
//  ExtendedWidgetEntryView.swift
//  SwipeSmart
//
//  Created by Tyler Xiao on 11/4/24.
//
import WidgetKit
import SwiftUI
import Foundation
struct ExtendedWidgetEntryView : View {
    var entry: WidgetProvider.Entry
    let card: CreditCard

    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading){
                        Text(card.bankName)
                            .font(.title3.weight(.bold))
                            .padding(.bottom, 5)
                        Text(card.cardName)
                            .multilineTextAlignment(.trailing)
                        Spacer()
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text((card.cardType == "Discover" || card.cardType == "American Express") ? "" : card.cardType)
                            .font(.title3.weight(.bold))
                        Spacer()
                    }
                    .padding(.trailing, -25)
                }
                RoundedRectangle(cornerRadius:7)
                    .frame(width: 30, height: 20)
                    .padding(.bottom, 5)
                    .foregroundStyle(Color("pastelgraylight"))
                HStack {
                    if card.digits.isEmpty {
                        Text("**** **** **** ****")
                    }
                    else {
                        Text("**** **** **** \(card.digits)")
                    }
                }
            }
            .padding()
        }
    }
}
