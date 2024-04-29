import SwiftUI

@main
struct App: SwiftUI.App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @State private var shouldSeeMoreInterview: FirebaseInterviewModel?

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeScreen(
                    interviewsRepository: FirabseInterviewsReposiory(),
                    seeMoreAboutInterviewCoorinator: coordinateToSeeMoreAboutInterview
                )
                .navigationDestination(
                    item: $shouldSeeMoreInterview,
                    destination: InterviewScreen.init
                )
            }
            .task {
                await InterviewManualSeed.input()
            }
        }
    }
    
    private func coordinateToSeeMoreAboutInterview(interview: FirebaseInterviewModel) {
        shouldSeeMoreInterview = interview
    }
}
