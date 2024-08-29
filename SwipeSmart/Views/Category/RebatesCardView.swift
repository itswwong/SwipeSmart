//
//  RebatesCardView.swift
//
//  Displays specific credit card rebate information within RebatesView.
//

import SwiftUI

struct RebatesCardView: View {
    let card: CreditCard
    let rebate: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("\(rebate)%")
                            .foregroundColor(.white)
                            .font(.headline)
                    )
                Spacer()
            }
            Text(card.bankName)
                .font(.headline)
            Text(card.cardName)
                .font(.subheadline)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
    }
}

struct RebatesCardView_Previews: PreviewProvider {
    static var previews: some View {
        RebatesCardView(card: CreditCard.sampleCards[0], rebate: 15)
            .previewLayout(.sizeThatFits)
    }
}
