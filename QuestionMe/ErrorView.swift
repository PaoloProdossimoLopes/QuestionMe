import SwiftUI

typealias Completion = () -> Void
typealias CompletionWith<T> = (T) -> Void

struct ErrorView: View {

    let tryAgainAction: Completion

    var body: some View {
        BackgroundView {
            VStack(alignment: .leading, spacing: 22) {
                SymbolImage(.exclamationmarkTriangle)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)

                VStack(alignment: .leading, spacing: 12) {
                    HeadlineText("Ocorreu um problema")

                    BodyText("Algo deu errado ao realizarmos a operação")
                }

                Spacer()

                VStack(spacing: 14) {
                    OutlineButton("Tentar novamente")
                        .onTapGesture(perform: tryAgainAction)
                }
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ErrorView(tryAgainAction: {})
}
