import SwiftUI

// swiftlint:disable identifier_name
func BackgroundView<Content: View>(@ViewBuilder content: () -> Content) -> some View {
    ZStack {
        Color.white.ignoresSafeArea()

        content()
    }
}
