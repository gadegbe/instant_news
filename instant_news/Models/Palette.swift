//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

struct Palette: Hashable {
    let name: String
    let colors: [PaletteColor]
    // other properties

    static let fancy = Palette(name: "Fancy", colors: [
        PaletteColor(name: "Red", color: .systemRed),
        PaletteColor(name: "Blue", color: .systemBlue),
        PaletteColor(name: "Cyan", color: .cyan),
        PaletteColor(name: "Mint", color: .systemIndigo),
        PaletteColor(name: "Pink", color: .systemPink),
        PaletteColor(name: "Teal", color: .systemTeal),
        PaletteColor(name: "Green", color: .systemGreen),
        PaletteColor(name: "Brown", color: .systemBrown)
    ])

    static let secondary = Palette(name: "Secondary", colors: [
        PaletteColor(name: "Label", color: .secondaryLabel),
        PaletteColor(name: "Fill", color: .secondarySystemFill)
    ])
}

struct PaletteColor: Hashable {
    let name: String
    let color: UIColor
    // other properties
}