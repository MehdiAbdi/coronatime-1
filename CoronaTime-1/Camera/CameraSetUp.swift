//
//  CameraSetUp.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/6/21.
//

import UIKit
import AVFoundation

fileprivate enum Constant: CGFloat {
    case x = 0.0
    case y = -100.0
}

class CameraSetUp: ImageRecognition, AVCaptureVideoDataOutputSampleBufferDelegate {
    var text = String()
    private let videoQueue = DispatchQueue(label: "videoQueue")
    private let captureSession = AVCaptureSession()
    private let deviceFrame = DeviceFrame()
    
    private let notificationCenter = NotificationCenter.default
    private let notificationName = Notification.Name.recognitionResult
    /**
     - Parameters:
        - device: **Video** recommended
        - preset: **Photo** recommended
     */
    /// Configure captureSession
    /// and add video input to session
    func setUpCapture(for device: AVMediaType, preset: AVCaptureSession.Preset) {
        captureSession.sessionPreset = preset
        
        guard let videoDevice = AVCaptureDevice.default(for: device) else { return }
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoDevice)
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            }
        } catch {
            print("Error While Capturing Device")
        }
        captureSession.startRunning()
    }
    
    func videoDataOutput() {
        let output = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: videoQueue)
        captureSession.addOutput(output)
    }
    
    func videoPreviewLayer(for view: UIView) {
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = CGRect(x:Constant.x.rawValue,
                                    y: Constant.y.rawValue,
                                    width: deviceFrame.widthDevice,
                                    height: deviceFrame.heightDevice)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        notificationCenter.post(name: notificationName, object: nil, userInfo: ["result" : resultRecognition])
    }
}
