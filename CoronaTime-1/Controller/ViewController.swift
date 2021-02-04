//
//  ViewController.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/3/21.
//

import UIKit

class ViewController: UIViewController {
    private let privacyAuthentication = PrivacyAuthentication()
    private let cameraSetUp = CameraSetUp()
    private let resultView = ResultView()
    private let cube = CubeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        privacyAuthentication.cameraAuthentication()
        
        cameraSetUp.setLabelDelegate = self
        cameraSetUp.setUpCapture(for: .video, preset: .photo)
        cameraSetUp.videoDataOutput()
        cameraSetUp.videoPreviewLayer(for: view)
        
        cube.setUpSceneCreator(contentView: view)
        cube.puaseCubeAnimation()
        cube.changeCubeColor()
        
        view.addSubview(resultView.resultLabel)
        resultView.constraintResultView(view)
        
        
//        view.addSubview(resultView.changeColorBTN)
//        resultView.constraintButton(view)
//        resultView.changeColorBTN.addTarget(self, action: #selector(press), for: .touchUpInside)
    }
    
//    @objc func press() {
//        cube.changeCubeColor()
//        cube.cubeColor.toggle()
//    }
}

extension ViewController: SetLabelDelegate {
    func setLabel(text: String) {
        DispatchQueue.main.async {
            self.resultView.resultLabel.text = text
        }
    }
}
