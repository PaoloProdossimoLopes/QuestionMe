import Foundation
import FirebaseFirestore

extension Encodable {
    func dict() -> [String: Any] {
        let json = try? JSONSerialization.jsonObject(with: jsonData(), options: [])

        guard let dictionary = json as? [String: Any] else {
            return [:]
        }

        return dictionary
    }

    private func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}

// swiftlint:disable function_body_length
class InterviewManualSeed {

    static func input() async {
        guard false else { return }
        let db = Firestore.firestore()
        let id = UUID().uuidString
        do {
            try await db
                .collection("entrevistas")
                .document(id)
                .setData(FirebaseInterviewModel(
                        id: id,
                        title: "Basido do Swift",
                        description: "Avaliação cuidadosamente estruturada destinada a candidatos que buscam posições como desenvolvedores iOS, macOS, watchOS e VisionOS.",
                        difficulty: .easy,
                        duration: 120,
                        questions: [
                            FirebaseInterviewModel.Question(
                                id: 1,
                                question: "Qual dos seguintes é um tipo de dado correto em Swift?",
                                type: .single,
                                alternatives: [
                                    FirebaseInterviewModel.Alternative(
                                        id: 1,
                                        anwser: "integer",
                                        isCorrect: false
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 2,
                                        anwser: "int",
                                        isCorrect: false
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 3,
                                        anwser: "Int",
                                        isCorrect: true
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 4,
                                        anwser: "INT",
                                        isCorrect: false
                                    )
                                ]
                            ),
                            FirebaseInterviewModel.Question(
                                id: 2,
                                question: "Como você declara uma constante em Swift?",
                                type: .single,
                                alternatives: [
                                    FirebaseInterviewModel.Alternative(
                                        id: 1,
                                        anwser: "let constantName = \"value\"",
                                        isCorrect: true
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 2,
                                        anwser: "const constantName = \"value\"",
                                        isCorrect: false
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 3,
                                        anwser: "constant constantName = \"value\"",
                                        isCorrect: false
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 4,
                                        anwser: "var constantName = \"value\"",
                                        isCorrect: false
                                    )
                                ]
                            ),
                            FirebaseInterviewModel.Question(
                                id: 3,
                                question: "Qual é a sintaxe correta para definir um enum em Swift?",
                                type: .single,
                                alternatives: [
                                    FirebaseInterviewModel.Alternative(
                                        id: 1,
                                        anwser: "enum CompassPoint { case north, south, east, west }",
                                        isCorrect: true
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 2,
                                        anwser: "enumerator CompassPoint { case north, south, east, west }",
                                        isCorrect: false
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 3,
                                        anwser: "enumerator CompassPoint { case north, south, east, west }",
                                        isCorrect: false
                                    ),
                                    FirebaseInterviewModel.Alternative(
                                        id: 4,
                                        anwser: "enumeration CompassPoint { north, south, east, west }",
                                        isCorrect: false
                                    )
                                ]
                            )
                        ]
                   ).dict())

            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
        }
    }
}
