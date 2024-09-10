import RealityKit
import RealityMoreShape
import SwiftUI

struct TaurusView: View {
    var body: some View {
        RealityView { content in
            let material = PhysicallyBasedMaterial()
            let mesh = try? MeshResource.generateTorus(minorRadius: 0.02,
                                                       majorRadius: 0.1)
            if let mesh {
                let modelEntity = ModelEntity(mesh: mesh, materials: [material])
                modelEntity.name = "Taurus"
                content.add(modelEntity)
            }
        }
        .frame(width: 100, height: 100)
    }
}

#Preview(windowStyle: .automatic) {
    TaurusView()
}
