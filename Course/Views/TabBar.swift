//
//  TabBar.swift
//  Course
//
//  Created by Dalveer singh on 08/10/22.
//

import SwiftUI
import RiveRuntime
struct TabBar: View {
    var body: some View {
        HStack {
            RiveViewModel(fileName: "icons",stateMachineName: "CHAT_Interactivity",artboardName: "CHAT").view()
        }
        .background(Color("Background 2").opacity(0.8))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
