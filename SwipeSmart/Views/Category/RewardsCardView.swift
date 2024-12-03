//
//  RewardsCardView.swift
//
//  Displays specific credit card reward information within RewardsView.
//

import SwiftUI


struct RewardsCardView: View {
    let card: CreditCard
    let reward: Double
    let startDate: Date?
    let expirationDate: Date?
    let expired: Bool
    let future: Bool
    let strokeColor: Color


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                    Text(card.bankName)
                        .font(.custom("Inter-Regular_Thin", size: 15))
                        .padding(.bottom, 2)
                        .foregroundStyle(expired || future ? .pastelgraydarkest : strokeColor)
                    Spacer()
                    Text(reward == floor(reward) ? "\(Int(reward))%" : String(format: "%.1f%%", reward))
                        .font(.custom("Inter-Regular_Thin", size: 15))
                        .foregroundStyle(expired ? .pastelgraydarkest : strokeColor)
                        //.frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            HStack {
                Spacer()
                if !card.cardName.isEmpty {
                    Text(card.cardName)
                        .font(.custom("Inter-Regular_Light", size: 15))
                        .padding(.bottom, 15)
                        .foregroundStyle(expired || future ? .pastelgraydarkest : strokeColor)
                }
            }
            Spacer()
            HStack {
                if card.digits.isEmpty {
                    Text("**** **** **** ****")
                        .font(.custom("Inter-Regular_Light", size: 15))
                }
                else {
                    Text("**** **** **** \(card.digits)")
                        .font(.custom("Inter-Regular_Light", size: 15))
                }
            }
            HStack (alignment: .top){
                VStack {
                    if expired {
                        Text("EXPIRED")
                            .font(.custom("Inter-Regular_Light", size: 15))
                            .foregroundStyle(.red)
                    } else if future {
                        if let date = startDate {
                            HStack {
                                Text("Activates:")
                                    .font(.custom("Inter-Regular_Light", size: 15))
                                Text(date, format: Date.FormatStyle()
                                    .month(.twoDigits)
                                    .day(.twoDigits)
                                    .year(.defaultDigits))
                                .font(.custom("Inter-Regular_Light", size: 15))
                                }
                            }
                        else {
                            Text("Cannot find start date.")
                                .font(.custom("Inter-Regular_Light", size: 15))
                                .foregroundStyle(.red)
                        }
                    }
                    else {
                        if let date = expirationDate {
                            HStack {
                                Text(date, format: Date.FormatStyle()
                                    .month(.twoDigits)
                                    .year(.twoDigits))
                                .font(.custom("Inter-Regular_Light", size: 15))
                                .foregroundStyle(strokeColor)
                            }
                        }
                        else {
                            Text("Does not expire.")
                                .font(.custom("Inter-Regular_Light", size: 15))
                                .foregroundStyle(strokeColor)
                        }
                    }
                }
                Spacer()
                VStack {
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
            }
        .padding(30)
        .frame(height: 240)
    }
}

struct RewardsCardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsCardView(card: CreditCard.sampleCards[0], reward: 15, startDate: Date(), expirationDate: Date(), expired: false, future: false, strokeColor: CreditCard.sampleCards[0].theme.accentColor)
            .previewLayout(.sizeThatFits)
    }
}
