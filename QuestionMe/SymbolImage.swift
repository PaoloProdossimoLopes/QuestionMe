import SwiftUI

// swiftlint:disable identifier_name
func SymbolImage(_ symbol: Symbol) -> Image {
    return Image(systemName: symbol.systemName)
}

extension Symbol {
    var systemName: String {
        rawValue
    }
}
