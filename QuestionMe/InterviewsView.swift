import SwiftUI

struct InterviewsView: View {

    @State private var viewState = ViewState.loading

    let interviewsRepository: FirabseInterviewsReposiory
    let seeMoreAboutInterviewCoorinator: CompletionWith<FirebaseInterviewModel>

    var body: some View {
        BackgroundView {
            switch viewState {
            case .loading:
                CircularLoader()
            case .error:
                ErrorView(tryAgainAction: fetchInterview)
            case .content(let interviews):
                makeContent(interviews: interviews)
            }
        }
        .onAppear(perform: fetchInterview)
    }

    private func makeContent(interviews: [FirebaseInterviewModel]) -> some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: Array(repeating: GridItem(), count: 2),
                spacing: 12,
                content: {
                    makeCards(interviews: interviews)
                }
            )
            .padding(.horizontal)
        }
    }

    private func makeCards(interviews: [FirebaseInterviewModel]) -> some View {
        ForEach(interviews) { item in
            InterviewCardItemView(
                title: item.title,
                description: item.description,
                buttonTitle: "ver mais",
                buttonAction: {
                    cardButtonActionHandler(interview: item)
                }
            )
        }
    }
    
    private func cardButtonActionHandler(interview: FirebaseInterviewModel) {
        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        seeMoreAboutInterviewCoorinator(interview)
    }

    private func fetchInterviews() async {
        viewState = .loading
        do {
            let interviews = try await interviewsRepository.findAllInterviews()
            viewState = .content(interviews: interviews)
        } catch {
            viewState = .error
        }
    }
    
    private func fetchInterview() {
        Task {
            await fetchInterviews()
        }
    }

    enum ViewState {
        case loading
        case error
        case content(interviews: [FirebaseInterviewModel])
    }
}

#Preview {
    InterviewsView(
        interviewsRepository: FirabseInterviewsReposiory(),
        seeMoreAboutInterviewCoorinator: { _ in }
    )
}
