//
//  SceneCreator.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/27/21.
//

import Foundation
import SceneKit

class SceneCreator {
    let cam = CameraSetUp()
    
    private let scene = SCNScene(named: "art.scnassets/Cube.scn")
    private let sceneHeight = DeviceFrame().sceneHeight
    
    private let sceneView: SCNView = {
        let view = SCNView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.allowsCameraControl = true
        view.showsStatistics = true
        return view
    }()
    
    //MARK: - Providing access to protected properties
    var cubeScene: SCNScene? {
        guard scene != nil else { return nil }
        return scene
    }
    
    func sceneInitializer(_ view: UIView) {
        sceneView.scene = scene
        view.addSubview(sceneView)
    }
    
    func setUpSceneConstraint(_ view: UIView) {
        NSLayoutConstraint.activate([
            sceneView.topAnchor.constraint(equalTo: view.topAnchor, constant: sceneHeight),
            sceneView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sceneView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sceneView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

