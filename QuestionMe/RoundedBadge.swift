import SwiftUI

struct RoundedBadge: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 10) {
            BodyText(title)
            HeadlineText(value)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray100)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}
