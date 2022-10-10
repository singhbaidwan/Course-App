//
//  Hcard.swift
//  Course
//
//  Created by Dalveer singh on 09/10/22.
//

import SwiftUI

struct Hcard: View {
    var section:CourseSection
    var body: some View {
        HStack(spacing:20){
            VStack(alignment:.leading,spacing: 8){
                Text(section.title)
                    .customFont(.title2)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(section.caption)
                    .customFont(.body)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth:.infinity,maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}

struct Hcard_Previews: PreviewProvider {
    static var previews: some View {
        Hcard(section: courseSections[1])
    }
}
