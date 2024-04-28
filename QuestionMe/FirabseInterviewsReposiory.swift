import FirebaseFirestore

class FirabseInterviewsReposiory {
    func findAllInterviews() async throws -> [FirebaseInterviewModel] {
        let interviewsDocument = try await Firestore
            .firestore()
            .collection("entrevistas")
            .getDocuments()

        return interviewsDocument
            .documents
            .map { try? $0.data(as: FirebaseInterviewModel.self) }
            .compactMap { $0 }
    }
 }
