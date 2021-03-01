//
//  SceneView.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 2/21/21.
//

import Foundation
import SceneKit

class SceneView {
    let sceneView: SCNView = {
        let view = SCNView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.allowsCameraControl = false
        view.showsStatistics = true
        return view
    }()
}
