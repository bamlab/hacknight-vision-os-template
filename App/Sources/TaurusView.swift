import RealityKit
import SimpleBall
import SwiftUI

struct TaurusView: View {

    @State private var scale: Float = 0.001

    var body: some View {
        VStack(spacing: 18) {

            RealityView { content in
                if let usdzURL = Bundle.main.url(forResource: "gramophone", withExtension: "usdz") {
                    if let gramophoneEntity = try? await Entity(contentsOf: usdzURL){
                        content.add(gramophoneEntity)
//                        gramophoneEntity.position = [0,-1,0]
                    }
                }
            } update: { content in
                if let gramophoneEntity = content.entities.first {
                    gramophoneEntity.transform.scale = [scale, scale, scale]
                }
            } placeholder: {
                ProgressView()
            }

            Slider(value: $scale, in: 0.0...0.005)
            .padding()
            .glassBackgroundEffect()
        }
    }
}
