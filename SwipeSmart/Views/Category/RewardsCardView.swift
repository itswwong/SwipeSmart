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
                        .padding(.bottom, 2)
                    Text(card.cardName.isEmpty ? card.cardType : card.cardName)
                        .font(.headline)
                        .padding(.bottom, 15)
                    Text("**** **** **** \(card.digits)")
                        .padding(.bottom, 2)
                    if expired {
                        Text("Expired")
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
                        }
                    }
                }
                Spacer()
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("\(reward)%")
                            .foregroundColor(expired ? .pastelgraydark :card.color.mainColor)
                            .font(.headline)
                    )
            }
        }
        .padding()
    }
}

struct RewardsCardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsCardView(card: CreditCard.sampleCards[0], reward: 15, expirationDate: Date(), expired: false)
            .previewLayout(.sizeThatFits)
    }
}
