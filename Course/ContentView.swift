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
            Color("Background 2")
                .ignoresSafeArea()
            SideMenu()
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x:0,y:1,z:0))
            Group{
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")

            }
        }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height:80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height:104)
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .rotation3DEffect(.degrees( isOpen ? 30 :0), axis:(x:0,y:-1,z:0))
            .offset(x: isOpen ? 265 : 0)
            .scaleEffect(isOpen ? 0.9 : 1 )
            .ignoresSafeArea()
            button.view()
                .frame(width:44,height:44)
                .mask(Circle())
                .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
                .padding()
                .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
                .offset(x: isOpen ? 216 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring()) {
                        isOpen.toggle()
                    }
                }
            TabBar()
                .offset(y:isOpen ? 300 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
