//
//  ContentView.swift
//  Course
//
//  Created by Dalveer singh on 06/10/22.
//

import SwiftUI
import RiveRuntime
struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab:Tab = .chat
    @State var isOpen:Bool = false
    let button = RiveViewModel(fileName: "menu_button",stateMachineName: "State Machine",autoPlay: false)

    var body: some View {
        ZStack {
            switch selectedTab {
            case .chat:
                Text("chat")
            case .search:
                Text("Search")
            case .timer:
                Text("Timer")
            case .bell:
                Text("Bell")
            case .user:
                Text("User")
            }
            button.view()
                .frame(width:44,height:44)
                .mask(Circle())
                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
                .padding()
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    isOpen.toggle()
                }
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
