//
//  RewardsCardView.swift
//
//  Displays specific credit card reward information within RewardsView.
//

import SwiftUI

struct RewardsCardView: View {
    let card: CreditCard
    let reward: Int
    let expirationDate: Date?
    let expired: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(card.bankName)
                        .font(.title2.weight(.bold))
                    Text(card.cardName)
                        .font(.title3)
                        .padding(.bottom, 10)
                    if expired {
                        Text("EXPIRED")
                            .font(.subheadline)
                    }
                    else {
                        if let date = expirationDate {
                            HStack {
                                Text("Expires:")
                                    .font(.headline)
                                Text(date, format: Date.FormatStyle()
                                    .month(.twoDigits)
                                    .day(.twoDigits)
                                    .year(.defaultDigits))
                            }
                        }
                        else {
                            Text("Does not expire.")
                                .font(.subheadline)
                        }
                    }
                }
                .foregroundColor(.white)
                Spacer()
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("\(reward)%")
                            .foregroundColor(expired ? darkGray : pastelGreen)
                            .font(.headline)
                    )
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(expired ? darkGray : pastelGreen))
    }
}

struct RewardsCardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsCardView(card: CreditCard.sampleCards[0], reward: 15, expirationDate: Date(), expired: false)
            .previewLayout(.sizeThatFits)
    }
}
