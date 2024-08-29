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
            HStack() {
                VStack {
                    Text("Credit Card")
                        .font(titleFont)
                    Spacer()
                }
                Spacer()
                Spacer()
                VStack(alignment: .trailing) {
                    Text(card.bankName)
                        .font(titleFont)
                    Text(card.cardName)
                        .font(titleFont)
                        .multilineTextAlignment(.trailing)

                    Spacer()
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: 7)
                .fill(.white)
                .frame(width: 30, height: 20)
                .padding(.bottom, 5)
            HStack(spacing: 0) {
                Text("**** **** **** ")
                Text("1234")
                    .font(bodyFont)
            }
                
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct CardView_Previews: PreviewProvider {
    static var card = CreditCard.sampleCards[0]
    static var previews: some View {
        CardView(card: card)
            .background(.gray)
            .previewLayout(.fixed(width: 250, height: 150))
    }
}
