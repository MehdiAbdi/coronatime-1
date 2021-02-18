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
    private var recognitionResult = RecognitionResult.sharedResult
    
    let notification = NotificationCenter.default
    let notificationName = Notification.Name.recognitionResult
    
    override func viewDidLoad() {
        super.viewDidLoad()
        privacyAuthentication.cameraAuthentication()
        
        cameraSetUp.setUpCapture(for: .video, preset: .photo)
        cameraSetUp.videoDataOutput()
        cameraSetUp.videoPreviewLayer(for: view)
        
        cube.setUpSceneCreator(contentView: view)
        cube.puaseCubeAnimation()
        cube.changeCameraPosition()
        
        view.addSubview(resultView.resultLabel)
        resultView.constraintResultView(view)

        notificationObserver()
    }
    
    func notificationObserver() {
        notification.addObserver(self,
                                 selector: #selector(ViewController.updateLabel(notification:)),
                                 name: notificationName, object: nil)
    }
    
    @objc func updateLabel(notification: Notification) {
        guard let result = notification.userInfo?["result"] as? String else { return }
        
        DispatchQueue.main.async {
            self.resultView.resultLabel.text = result
        }
    }
}
