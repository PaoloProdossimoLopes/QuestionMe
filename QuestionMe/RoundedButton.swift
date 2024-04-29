import SwiftUI

// swiftlint:disable identifier_name
func RoundedButton(_ title: String) -> some View {
    BodyText(title, color: .white)
        .padding(.horizontal, 18)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, minHeight: 44)
        .background(.black)
        .clipShape(Capsule())
}

// swiftlint:disable identifier_name
func OutlineButton(_ title: String) -> some View {
    BodyText(title, color: .black)
        .padding(.horizontal, 18)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, minHeight: 44)
        .background(Capsule().stroke(lineWidth: 2))
}
