//
//  CategoryView.swift
//  cardappIOS
//
//  Created by William Wong on 9/13/23.
//

import SwiftUI

struct CategoryView: View {
    @Binding var cards: [CreditCard]
    @Binding var category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Spacer()
                VStack {
                    Spacer()
                    Text(category.name)
                        .font(bodyFont)
                    Spacer()
                }
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(cards: .constant(CreditCard.testCards), category: .constant(Category.sampleCategories[0]))
            .background(.gray)
            .previewLayout(.fixed(width: 250, height: 150))
    }
}
