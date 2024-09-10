import SwiftUI
import RealityKit

struct GramophoneView: View {
    var body: some View {
        RealityView { content in
            if let usdzURL = Bundle.main.url(forResource: "gramophone", withExtension: "usdz") {
                do {
                    let entity = try await Entity(contentsOf: usdzURL)
                    content.add(entity)
                    
                    entity.position = [0,-0.2,0]
                } catch {
                    print("Failed to load USDZ file: \(error.localizedDescription)")
                }
            }
        } 
        
    placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    GramophoneView()
}
