//
//  TabBar.swift
//  Course
//
//  Created by Dalveer singh on 08/10/22.
//

import SwiftUI
import RiveRuntime
enum Tab:String {
    case chat
    case search
    case timer
    case bell
    case user
}
struct TabItem:Identifiable{
    var id = UUID()
    var icon:RiveViewModel
    var tab:Tab
}

var tabItems = [
    TabItem(icon:  RiveViewModel(fileName: "icons",stateMachineName: "CHAT_Interactivity",artboardName: "CHAT"), tab: .chat),
    TabItem(icon:  RiveViewModel(fileName: "icons",stateMachineName: "SEARCH_Interactivity",artboardName: "SEARCH"), tab: .search),
    TabItem(icon:  RiveViewModel(fileName: "icons",stateMachineName: "TIMER_Interactivity",artboardName: "TIMER"), tab: .timer),
    TabItem(icon:  RiveViewModel(fileName: "icons",stateMachineName: "BELL_Interactivity",artboardName: "BELL"), tab: .bell),
    TabItem(icon:  RiveViewModel(fileName: "icons",stateMachineName: "USER_Interactivity",artboardName: "USER"), tab: .user)
]

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab:Tab = .chat
    var body: some View {
        VStack {
            Spacer()
            HStack {
                content
            }
            .padding(12)
            .background(Color("Background 2").opacity(0.8))
            .background(.ultraThinMaterial)
            .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.5),.white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
            )
            .mask {
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .padding(.horizontal,24)
            }
        }
    }
    var content:some View{
        ForEach(tabItems) { item in
            Button{
                item.icon.setInput("active", value: true)
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                    item.icon.setInput("active", value: false)
                }
                withAnimation {
                    selectedTab = item.tab
                }
            }label: {
                item.icon
                    .view()
                    .frame(height:36)
                    .opacity(selectedTab==item.tab ? 1 : 0.5)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.accentColor)
                                .frame(width: selectedTab == item.tab ? 20 : 0,height:4)
                                .opacity(selectedTab==item.tab ? 1 : 0)
                                .offset(y:-4)
                            Spacer()
                        }
                    )
            }
        }

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


