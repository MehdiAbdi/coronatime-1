//
//  PrivacyAuthentication.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/3/21.
//

import Foundation
import AVFoundation

class PrivacyAuthentication {
    
    func cameraAuthentication() {
        switch AVCaptureDevice.authorizationStatus(for: AVMediaType.video) {
        case .authorized:
            print("Already Authorized")
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted) in
                if granted {
                    print("Permission Granted")
                }
            }
        case .denied:
            print("denied")
            return
        case .restricted:
            print("restricted")
            return
        default:
            return
        }
    }
}
