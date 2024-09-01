//
//  RewardsCardView.swift
//
//  Displays specific credit card reward information within RewardsView.
//

import SwiftUI

struct RewardsCardView: View {
    let card: CreditCard
    let reward: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("\(reward)%")
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

struct RewardsCardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsCardView(card: CreditCard.sampleCards[0], reward: 15)
            .previewLayout(.sizeThatFits)
    }
}
