//
//  ImageRecognition.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/10/21.
//

import Foundation
import Vision

class ImageRecognition: NSObject {
    private let configurationModel = MLModelConfiguration()
    var imageMatch = String()
    
    func configuration(pixelBuffer: CVPixelBuffer) {
        guard let mlModel = try? VNCoreMLModel(for: MaskClassifier(configuration: configurationModel).model) else { return }
        
        let request = VNCoreMLRequest(model: mlModel) { (mlRequest, err) in
            if let error = err {
                print("error while analysis request \(error)")
            }
            
            guard let result = mlRequest.results as? [VNClassificationObservation] else { return }
            guard let firstMatch = result.first else { return }
            
            self.imageMatch = firstMatch.identifier
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}
