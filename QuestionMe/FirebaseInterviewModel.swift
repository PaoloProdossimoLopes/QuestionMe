import Foundation

struct FirebaseInterviewModel: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let difficulty: Difficulty
    let duration: Int
    let questions: [Question]

    enum CodingKeys: String, CodingKey {
        case id
        case title = "titulo"
        case description = "descricao"
        case difficulty = "dificuldade"
        case duration = "duracao"
        case questions = "questoes"
    }

    enum Difficulty: String, Codable {
        case easy = "facil"
        case mid = "medio"
        case hard = "dificil"
        case insane = "insano"
        case impossible = "impossivel"
    }

    struct Question: Codable, Identifiable {
        let id: Int
        let question: String
        let type: QuestionType
        let alternatives: [Alternative]

        enum CodingKeys: String, CodingKey {
            case id
            case question = "pergunta"
            case type = "tipo"
            case alternatives = "alternativas"
        }
    }

    enum QuestionType: String, Codable {
        case single = "SINGLE"
        case mult = "MULT"
    }

    struct Alternative: Codable, Identifiable {
        let id: Int
        let anwser: String
        let isCorrect: Bool

        enum CodingKeys: String, CodingKey {
            case id
            case anwser = "resposta"
            case isCorrect = "estaCorreta"
        }
    }
}
