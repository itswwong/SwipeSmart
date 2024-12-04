
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CreditCard.sampleCards[0], strokeColor: CreditCard.sampleCards[0].theme.accentColor)
    }
}

//
//  CardView.swift
//
//  Display individual credit card.
//

import SwiftUI

struct CardView: View {
    let card: CreditCard
    let strokeColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(card.bankName)
//                    .font(.custom("Inter-Regular_Thin", size: 15))
                    .textCase(.uppercase)
                    .foregroundStyle(strokeColor)
                Spacer()
            }
            .padding(.bottom, 30)
//            Spacer()
            
            HStack {
                Spacer()
                Text(card.cardName)
                    .multilineTextAlignment(.trailing)
//                    .font(.custom("Inter-Regular_Thin", size: 15))
                    .fontWeight(.medium)
                    .foregroundStyle(strokeColor)
            }
            .padding(.bottom, 30)
//            Spacer()
            
            HStack {
                if card.digits.isEmpty {
                    Text("**** **** **** ****")
                }
                else {
                    Text("**** **** **** \(card.digits)")
                }
            }
            
            HStack (alignment: .top) {
                Spacer()
                if card.cardType == "Visa" {
                    Image("visa")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .tint(Color("AccentColor"))
                } else if card.cardType == "Mastercard" {
                    Image("mastercard")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .tint(Color("AccentColor"))
                } else if card.cardType == "Discover" {
                    Image("discover")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .tint(Color("AccentColor"))
                } else if card.cardType == "American Express" {
                    Image("amex")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .tint(Color("AccentColor"))
                }
            }
            .padding(.top, -20)
        }
        .frame(height: 200)
        .padding(30)
    }
}
