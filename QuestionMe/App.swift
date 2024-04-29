import SwiftUI

@main
struct App: SwiftUI.App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var shouldSeeMoreInterview = false

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                InterviewsView(
                    interviewsRepository: FirabseInterviewsReposiory(),
                    seeMoreAboutInterviewCoorinator: coordinateToSeeMoreAboutInterview
                )
                .navigationDestination(
                    isPresented: $shouldSeeMoreInterview,
                    destination: EmptyView.init
                )
            }
            .task {
                await InterviewManualSeed.input()
            }
        }
    }
    
    private func coordinateToSeeMoreAboutInterview(interview: FirebaseInterviewModel) {
        shouldSeeMoreInterview.toggle()
    }
}
