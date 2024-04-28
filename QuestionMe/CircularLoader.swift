import SwiftUI

struct CircularLoader: View {

    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true

    private let size = CGFloat(80)
    private let lineWidth = CGFloat(10)

    var body: some View {

        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .fill(.gray100)
                .frame(width: size, height: size)

            Circle()
                .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
                .stroke(lineWidth: lineWidth)
                .clipShape(Capsule())
                .rotationEffect(.degrees(isCircleRotating ? 360 : 0))
                .frame(width: size, height: size)
                .foregroundColor(.black)
                .onAppear {
                    withAnimation(Animation
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false)) {
                            isCircleRotating.toggle()
                        }
                    withAnimation(Animation
                        .linear(duration: 1)
                        .delay(0.5)
                        .repeatForever(autoreverses: true)) {
                            animateStart.toggle()
                        }
                    withAnimation(Animation
                        .linear(duration: 1)
                        .delay(1)
                        .repeatForever(autoreverses: true)) {
                            animateEnd.toggle()
                        }
                }
        }
    }
}
