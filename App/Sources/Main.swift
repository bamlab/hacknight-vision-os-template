import SwiftUI

enum Page: String, CaseIterable, Identifiable {
    var id: String { rawValue }

    case hello
    case taurus
    case ball
    case gramophone
}

@main
struct Main: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State var selectedPage: Page = .hello

    var body: some View {
        NavigationSplitView {
            List(Page.allCases) { page in
                Button { selectedPage = page } label: {
                    Text(getPageTitle(from: page))
                }
                .contentShape(.hoverEffect, RoundedRectangle(cornerRadius: 16))
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 16)
                        .background(.clear)
                        .foregroundStyle(page == selectedPage
                            ? .thinMaterial
                            : .thickMaterial)
                )
            }
            .navigationTitle("VisionOs Demo")
        } detail: {
            switch selectedPage {
            case .taurus: TaurusView()
            case .ball: SimpleBallView()
            case .hello: HelloView()
            case .gramophone: GramophoneView()
            }
        }
    }

    func getPageTitle(from page: Page) -> String {
        page.rawValue.localizedCapitalized
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
