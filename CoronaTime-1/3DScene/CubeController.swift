//
//  CubeController.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/30/21.
//

import UIKit
import SceneKit

class CubeController: SceneCreator {

    var cubeColor = false
    let cubeName = "Cube"
    let cubeScaleAnimationName = "Cube_CubeScale_Animation"
    let cubeGreen = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    let cubeRed = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    var cubeNode: SCNNode? {
        guard let node = cubeScene?.rootNode.childNode(withName: cubeName, recursively: true)
            else { return nil }
        return node
    }
    
    func setUpSceneCreator(contentView: UIView) {
        sceneInitializer(contentView)
        setUpSceneConstraint(contentView)
    }
    
    //MARK:- Use sceneCreator's property accessor for adding functionality to 3D Cube and scene
    func puaseCubeAnimation() {
        cubeNode?.removeAnimation(forKey: cubeScaleAnimationName)
    }
    
    func changeCubeColor() {
        cubeNode?.geometry?.firstMaterial?.diffuse.contents = cubeColor ? cubeGreen : cubeRed
    }
}
