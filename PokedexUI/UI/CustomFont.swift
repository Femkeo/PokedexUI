//
//  CustomFonts.swift
//  PokedexUI
//
//  Created by Femke Offringa on 25/09/2019.
//  Copyright © 2019 Femke Offringa. All rights reserved.
//

import SwiftUI

struct CustomFont: View {
    let text : String
    var body: some View {
        Text(text).font(Font.custom("Quicksand-Regular", size: 18.0))
    }
}

struct CustomBlackFont: View {
    let text: String
    var body : some View {
        Text(text).foregroundColor(Color.black).font(Font.custom("Quicksand-Regular", size: 18.0))
    }
}

struct RedBoldFont : View {
    let text: String
    var body : some View {
        Text(text).foregroundColor(Color.red).font(Font.custom("Quicksand-Bold", size: 18.0))
    }
}

struct BlackBoldFont : View {
    let text: String
    var body: some View {
        Text(text).font(Font.custom("Quicksand-Bold", size: 18.0))
    }
}

struct WhiteTitleFont : View {
    let text: String
    var body: some View {
        Text(text).foregroundColor(Color.white).font(Font.custom("Quicksand-Regular", size: 24.0))
    }
}

struct CustomFonts_Previews: PreviewProvider {
    static var previews: some View {
        CustomFont(text: "Here some test text")
    }
}


