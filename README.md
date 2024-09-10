# VisionOS Template

This is a template for a VisionOS project. It uses [Tuist](https://tuist.io) to generate the project.

## How to use ?

### Clone & run
1. Install Tuist (`brew tap tuist/tuist; brew install --formula tuist`)
2. Clone this repository
3. In [Project.swift](./Project.swift), update the `name` of your project
4. Run `tuist generate`
5. In XCode, run the project

### Install a new dependency

1. Add the dependency in the `package` array in [Project.swift](./Project.swift)
   1. packages can be `.local` or `.remote`
2. Add the dependency in the `dependencies` array in [Project.swift](./Project.swift)
3. Run `tuist generate`

### Add an UZDZ (3D) Asset

1. Add the `.usdz` file in the `Resources` folder
2. Look at what's done in [GramophoneView](./App/Sources/GramophoneView.swift) and do the same !

## Useful resources

- [Awesome-Vision-Pro](https://github.com/jtmuller5/Awesome-Vision-Pro)
- [visionOS Examples](https://github.com/jordibruin/visionOS-Examples)
- [visionOS Tip & Tricks](https://github.com/jtmuller5/VisionOS-Tips-and-Tricks/tree/main)
- [Rick & Morty App](https://github.com/AdrianZzito/Rick-Morty-visionOS)
- [Apple Doc](https://developer.apple.com/visionos/pathway/)