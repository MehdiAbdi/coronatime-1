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
    
    let resultView = ResultView.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        privacyAuthentication.cameraAuthentication()
        
        cameraSetUp.setUpCapture(for: .video, preset: .photo)
        cameraSetUp.videoDataOutput()
        cameraSetUp.videoPreviewLayer(for: view)
        
        view.addSubview(resultView.resultLabel)
        resultView.constraintResultView(view)
        
    }
}

