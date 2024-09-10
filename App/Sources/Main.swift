import SwiftUI

enum Page: String, CaseIterable, Identifiable {
    var id: String { rawValue }

    case hello
    case taurus
    case ball
    case gramophone
    case immersiveView
}

@main
struct ImmersiveSpaceApp: App {


    var body: some Scene {
        WindowGroup {
            ContentView2()

        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveMeditationBuilder()

        }
        .immersionStyle(selection: .constant(.full), in:  .full)
    }
}

struct ContentView2: View {

    @State private var isImmersiveSpaceOpened = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        Button(isImmersiveSpaceOpened ? "Exit Immersive Space" : "Show Immersive Space", role: isImmersiveSpaceOpened ? .destructive : .none) {
            Task {
                if isImmersiveSpaceOpened {
                    await dismissImmersiveSpace()
                    isImmersiveSpaceOpened = false
                } else {
                    let result = await openImmersiveSpace(id: "ImmersiveSpace")
                    if result == .opened {
                        isImmersiveSpaceOpened = true
                    }
                }
            }
        }
    }
}

//@main
//struct Main: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

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
            case .immersiveView: ImmersiveView()
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

