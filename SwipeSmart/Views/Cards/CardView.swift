
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
                    .font(.custom("Inter-Regular_Thin", size: 15))
                    .padding(.bottom, 2)
                    .foregroundStyle(strokeColor)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Text(card.cardName)
                    .multilineTextAlignment(.trailing)
                    .font(.custom("Inter-Regular_Thin", size: 15))
                    .padding(.bottom, 2)
                    .foregroundStyle(strokeColor)
            }
            Spacer()
            HStack {
                if card.digits.isEmpty {
                    Text("**** **** **** ****")
                }
                else {
                    Text("**** **** **** \(card.digits)")
                }
            }
            Spacer()
            HStack {
                Spacer()
                if card.cardType == "Visa" {
                    Image("visa")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                } else if card.cardType == "Mastercard" {
                    Image("mastercard")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                } else if card.cardType == "Discover" {
                    Image("discover")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                } else if card.cardType == "American Express" {
                    Image("amex")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    
                }
            }
        }
        .frame(height: 160)
        .padding()
    }
}
