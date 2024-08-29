//
//  RebatesCardView.swift
//  cardappIOS
//
//  Created by William Wong on 9/16/23.
//
import SwiftUI

struct RebatesCardView: View {
    let card: CreditCard
    let rebate: Int  // Add this property to hold the rebate percentage

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Circle with rebate percentage
                Circle()
                    .fill(Color.blue)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("\(rebate)%")  // Display the rebate percentage
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

//import SwiftUI
//
//struct RebatesCardView: View {
//    let int: Int
//    let card: CreditCard
//    
//    var body: some View {
//        HStack {
//            VStack {
//                Circle()
//                    .frame(width: 25, height: 25, alignment: .center)
//                    .foregroundColor(.white)
//                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                    .overlay {
//                        Text(String())
//                            .font(smallFont)
//                            .foregroundColor(.gray)
//                            .frame(width: 8, height: 8, alignment: .center)
//                    }
////                Text(String(int))
////                    .font(smallFont)
////                    .foregroundColor(.white)
////                    .frame(width: 5, height: 5, alignment: .center)
////                    .padding()
////                    .background(
////                        Circle()
////                            .stroke(.white, lineWidth: 4)
////                            .foregroundColor(Color.white)
////                    )
////                ZStack(alignment: .top) {
////                  Circle()
////                        .stroke(.white, lineWidth: 3)
////
////
////                }
////                .frame(width: 30, height: 30, alignment: .center)
//                Spacer()
//            }
//            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 5))
//            VStack(alignment: .leading) {
//                HStack() {
//                    VStack {
//                        Text("Credit Card")
//                            .font(titleFont)
//                        Spacer()
//                    }
//                    Spacer()
//                    Spacer()
//                    VStack(alignment: .trailing) {
//                        Text(card.bankName)
//                            .font(titleFont)
//                        Text(card.cardName)
//                            .font(titleFont)
//                            .multilineTextAlignment(.trailing)
//
//                        Spacer()
//                    }
//                }
//                Spacer()
//                RoundedRectangle(cornerRadius: 7)
//                    .fill(.white)
//                    .frame(width: 30, height: 20)
//                    .padding(.bottom, 5)
//                HStack(spacing: 0) {
//                    Text("**** **** **** ")
//                    Text("1234")
//                        .font(bodyFont)
//                }
//                    
//            }
//            .padding()
//        .foregroundColor(.white)
//        }
//    }
//}
//
//struct RebatesCardView_Previews: PreviewProvider {
//    static var card = CreditCard.testCards[0]
//    static var int = 0
//    static var previews: some View {
//        RebatesCardView(int: int, card: card)
//            .background(.gray)
//            .previewLayout(.fixed(width: 250, height: 150))
//    }
//}
