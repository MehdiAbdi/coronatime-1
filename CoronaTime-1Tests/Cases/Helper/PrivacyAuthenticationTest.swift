//
//  PrivacyAuthenticationTest.swift
//  CoronaTime-1Tests
//
//  Created by Mehdi Abdi on 1/5/21.
//

import XCTest
import AVFoundation
import CoronaTime_1


class PrivacyAuthenticationTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrivacyAuthentication_IsAuthorized() {
        let Authorized = 3
        XCTAssertEqual(AVCaptureDevice.authorizationStatus(for: .video).rawValue, Authorized)
    }
}
