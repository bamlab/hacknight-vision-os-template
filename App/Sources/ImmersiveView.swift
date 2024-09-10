import RealityKit
import SimpleBall
import SwiftUI
import AVKit


struct ImmersiveView: View {

    var body: some View {
        Color.red
    }
}


struct ImmersiveMeditationBuilder: View {
   var body: some View {
      ZStack {
         RealityView { content, attachments in

            // Set up your video background file and player
            let asset = AVURLAsset(url: Bundle.main.url(forResource: "aa", withExtension: "mp4")!)
            let playerItem = AVPlayerItem(asset: asset)
            let player = AVPlayer()
             
             NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                         player.seek(to: .zero)
                         player.play() // Automatically replay the video
                     }


            // Attach the material to a large sphere that will serve as the skybox.
            let entity = Entity()
            entity.components.set(ModelComponent(
//                mesh: .generatePlane(width: 300, height: 500),
                mesh: .generateSphere(radius: 300),
                materials: [VideoMaterial(avPlayer: player)]
            ))

            // Ensure the texture image points inward at the viewer.
            entity.scale *= .init(x: -1, y: 1, z: 1)
//             entity.position = .init(x: 0, y: 10, z: -500)

            // Add the background to the main content.
            content.add(entity)

            // Add the BuildMeditationView attachment
            if let attachment = attachments.entity(for: "myMeditationBuilderView") {
               content.add(attachment)
            }

            // Play the video background
            player.replaceCurrentItem(with: playerItem)
            player.play()

         } attachments: {
             Attachment(id: "myMeditationBuilderView") {
                 VStack{}
             }
          }
      }
   }
}

