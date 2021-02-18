//
//  CubeController.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/30/21.
//

import UIKit
import SceneKit

class CubeController: SceneCreator {

    private let notification = NotificationCenter.default
    private let notificationName = Notification.Name.recognitionResult
    private let cubeNodeName = "Main"
    private let cameraNodeName = "camera"
    private let cubeScaleAnimationName = "Cube_CubeScale_Animation"
    private let cubeGreen = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    private let cubeRed = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    private var cubeNode: SCNNode? {
        guard let node = cubeScene?.rootNode.childNode(withName: cubeNodeName, recursively: true)
            else { return nil }
        return node
    }
    
    private var cameraNode: SCNNode? {
        guard let node = cubeScene?.rootNode.childNode(withName: cameraNodeName, recursively: true)
        else { return nil }
        return node
    }
    
    private func notificationObserver() {
        notification.addObserver(self, selector: #selector(changeCubeColor(notification:)), name: notificationName, object: nil)
    }
    
    @objc private func changeCubeColor(notification: Notification) {
        if notification.userInfo?["result"] as! String == "No Mask" {
            cubeNode?.runAction(SCNAction.rotateTo(x: 0, y: 3.15, z: 0, duration: 0.4))
        } else {
            cubeNode?.runAction(SCNAction.rotateTo(x: 0, y: 0, z: 0, duration: 0.4))
        }
    }

    //MARK:- Use sceneCreator's property accessor for adding functionality to 3D Cube and scene
    func puaseCubeAnimation() {
//        cubeNode?.removeAnimation(forKey: cubeScaleAnimationName)
    }
    
    func changeCameraPosition() {
        cameraNode?.position = SCNVector3(0, 21, -10)
        cameraNode?.scale = SCNVector3(10, 10, 10)
    }
    
    func setUpSceneCreator(contentView: UIView) {
        sceneInitializer(contentView)
        setUpSceneConstraint(contentView)
        notificationObserver()
    }
}
