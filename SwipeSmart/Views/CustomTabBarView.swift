//
//  CustomTabBarView.swift
//  SwipeSmart
//
//

import Foundation
import SwiftUI
struct CustomTabBarView: View {
    let tabs:[TabBarItem]
    @Binding var selection:TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    var body:some View{
        tabBarVersion2.onChange(of: selection) {
            withAnimation(.easeInOut ) {
                localSelection = selection
            }
        }
    }
}
struct CustomTabBarView_Previews:PreviewProvider {
    static let tabs:[TabBarItem] = [
        .Rewards,
        .CreditCards
    ]
    static var previews:some View {
        VStack{
            Spacer()
            CustomTabBarView(tabs: tabs,selection: .constant(tabs.first!),localSelection: tabs.first!)
        }
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View{
        HStack {
            Image(systemName:tab.iconName)
            Text(tab.title).font(.footnote)
        }
        .foregroundColor(localSelection==tab ? tab.color:Color.gray)
        .padding(.vertical,10)
        .frame(maxWidth:.infinity)
        .background(localSelection == tab ?tab.color.opacity(0.45):Color.clear)
        .cornerRadius(15)
    }
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs, id:\.self) { tab in
                tabView(tab:tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(3)
    }
    private func switchToTab(tab:TabBarItem) {
        selection = tab
    }
}
extension CustomTabBarView {
    private func tabView2(tab: TabBarItem) -> some View {
        HStack {
            Image(systemName:tab.iconName)
            Text(tab.title).font(.footnote)
        }
        .foregroundColor(localSelection==tab ? Color.white : Color("tabbar_text"))
        .padding(.vertical,10)
        .frame(maxWidth:.infinity)
        .background(ZStack {
            if localSelection == tab{
                RoundedRectangle(cornerRadius: 10).fill(tab.color).matchedGeometryEffect(id: "background_rectangle", in: namespace)
                    .frame(height:45)
            }
        })
    }
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id:\.self) { tab in
                tabView2(tab:tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .shadow(color: Color.black.opacity(0.3),radius: 10,x:0,y:5)
    }
}
