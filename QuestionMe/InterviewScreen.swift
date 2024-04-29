import SwiftUI

struct InterviewScreen: View {
    
    let interview: FirebaseInterviewModel
    
    var body: some View {
        BackgroundView {
            VStack(alignment: .leading, spacing: 22) {
                HStack(spacing: 18) {
                    RoundedBadge(
                        title: "Nivel",
                        value: interview.difficulty.rawValue.capitalized
                    )
                    RoundedBadge(
                        title: "Questões",
                        value: String(interview.questions.count)
                    )
                    RoundedBadge(
                        title: "Duração",
                        value: String(interview.duration)
                    )
                }
                
                VStack(alignment: .leading) {
                    HeadlineText("descrição da entrevista")
                    BodyText(interview.description)
                }
                
                Spacer()
                
                RoundedButton("começa entrevista")
            }
            .padding(.horizontal)
        }
        .navigationTitle(interview.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    InterviewScreen(interview: FirebaseInterviewModel(
        id: String(),
        title: String(),
        description: String(),
        difficulty: .easy,
        duration: 100,
        questions: []
    ))
}
