//
//  CustomTextField.swift
//  Course
//
//  Created by Dalveer singh on 07/10/22.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .padding(.leading,36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            )
            .overlay(
                Image("Icon Email")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.leading,8)
            )
    }
}

extension View{
    func customTextField() -> some View{
        modifier(CustomTextField())
    }
}
