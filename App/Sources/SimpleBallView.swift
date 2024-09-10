import RealityKit
import SimpleBall
import SwiftUI

struct SimpleBallView: View {
    var body: some View {
        Model3D(named: "Scene", bundle: simpleBallBundle)
            .padding()
    }
}

#Preview(windowStyle: .automatic) {
    SimpleBallView()
}
