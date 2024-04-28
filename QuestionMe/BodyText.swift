import SwiftUI

// swiftlint:disable identifier_name
func BodyText(_ text: String, color: Color = .black) -> Text {
    Text(text)
        .font(.body)
        .foregroundStyle(color)
}
