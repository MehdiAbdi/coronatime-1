//
//  DeviceFrame.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/6/21.
//

import UIKit

struct DeviceFrame {
    fileprivate let uiScreen = UIScreen.main.bounds
    
    var widthDevice: CGFloat {
        uiScreen.width
    }
    
    var heightDevice: CGFloat {
        uiScreen.height * 0.8
    }
}

