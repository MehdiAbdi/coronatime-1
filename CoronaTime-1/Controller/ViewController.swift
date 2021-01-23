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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        privacyAuthentication.cameraAuthentication()
        
        cameraSetUp.setLabelDelegate = self
        
        cameraSetUp.setUpCapture(for: .video, preset: .photo)
        cameraSetUp.videoDataOutput()
        cameraSetUp.videoPreviewLayer(for: view)
        
        view.addSubview(resultView.resultLabel)
        resultView.constraintResultView(view)
        
    }
}

extension ViewController: SetLabelDelegate {
//    var text: String {
//        get {
//            return ""
//        }
//        set {
//            DispatchQueue.main.async {
//                self.resultView.resultLabel.text = newValue
//            }
//        }
//    }
    
    func setText(text: String) {
        DispatchQueue.main.async {
            self.resultView.resultLabel.text = "Result is: \(text)"
        }
    }
}
