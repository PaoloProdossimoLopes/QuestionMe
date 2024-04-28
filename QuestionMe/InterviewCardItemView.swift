import SwiftUI

struct InterviewCardItemView: View {
    let title: String
    let description: String
    let buttonTitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 8) {
                HeadlineText(title)

                BodyText(description)
                    .lineLimit(4)
            }

            RoundedButton(buttonTitle)
        }
        .padding()
        .background(.gray100)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}
