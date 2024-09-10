import SwiftUI
import RealityKit

struct GramophoneView: View {
    var body: some View {
        RealityView { content in
            if let usdzURL = Bundle.main.url(forResource: "gramophone", withExtension: "usdz") {
                do {
                    let entity = try await Entity(contentsOf: usdzURL)
                    content.add(entity)
                } catch {
                    print("Failed to load USDZ file: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    GramophoneView()
}
