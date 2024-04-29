import SwiftUI

struct InterviewCardItemView: View {
    let title: String
    let description: String
    let buttonTitle: String
    let buttonAction: Completion

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 8) {
                HeadlineText(title)

                BodyText(description)
                    .lineLimit(4)
            }

            RoundedButton(buttonTitle)
                .onTapGesture(perform: buttonAction)
        }
        .padding()
        .background(.gray100)
        .clipShape(RoundedRectangle(cornerRadius: 22))
    }
}
