//
//  CardView.swift
//
//  Display individual credit card.
//

import SwiftUI

struct CardView: View {
    let card: CreditCard
    
    var body: some View {
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
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 30, height: 20)
                .padding(.bottom, 5)
                .foregroundColor(.pastelgraylight)
            Text("**** **** **** \(card.digits)")
        }
        .padding()
        .foregroundColor(.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: CreditCard.sampleCards[0])
    }
}
