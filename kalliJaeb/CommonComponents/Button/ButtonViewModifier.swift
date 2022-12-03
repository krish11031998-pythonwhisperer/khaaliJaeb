//
//  ButtonViewModifier.swift
//  kalliJaeb
//
//  Created by Krishna Venkatramani on 03/12/2022.
//

import Foundation
import SwiftUI
import SUI

//MARK: - ButtonConfig

enum ButtonType {
    case large(background: Color)
    case auto(background: Color)
}

//MARK: - ButtonConfigStyle
struct ButtonConfigStyle: ViewModifier {
    let config: ButtonType
    @State var size: CGSize = .zero
    init(config: ButtonType) {
        self.config = config
    }
    
    func body(content: Content) -> some View {
        switch config {
        case .large(let background):
            content
                .padding(7.5)
                .frame(height: 48)
                .fillWidth(alignment: .center)
                .background(background)
                .borderCard(borderColor: .surfaceBackgroundInverse, radius: 8, borderWidth: 1)
        case .auto(let background):
                content
                    .padding(.init(vertical: 7.5, horizontal: 20))
                    .background(background)
                    .sizing(size: $size)
                    .borderCard(borderColor: .surfaceBackgroundInverse, radius: size.minDim.half, borderWidth: 1)
        }
    }
}

//MARK: - View+ButtonConfig
extension View {
    func addButtonConfig(config: ButtonType) -> some View {
        modifier(ButtonConfigStyle(config: config))
    }
}
