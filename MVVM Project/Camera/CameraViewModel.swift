//
//  CameraViewModel.swift
//  MVVM Project
//
//  Created by Levan Gorjeladze on 20.02.23.
//

import Foundation
import UIKit
import AVFoundation

class CameraViewModel {
    
    let userDefaults = UserDefaults.standard
    let DBManager = DataBaseService()
}

extension CameraViewModel: CameraViewModelProtocol {
    var isFlashEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isFlashEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "isFlashEnabled")
        }
    }
    
    var isLivePhotoEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsLivePhotoEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "IsLivePhotoEnabled")

        }
    }
    
    var isWideScreenAvailable: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back){
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnabled: Bool {
        get {
            userDefaults.bool(forKey: "isWideScreenAvailable")
        }
        set {
            userDefaults.set(newValue,forKey: "isWideScreenAvailable")

        }
    }
    
    var isCameraFlipAvilable: Bool {
        if #available(iOS 3.0, *){
            return true
        }else{
            return false
        }
    }
    
    func getAvailableCameraModes() -> [CameraMode] {
        var modes = [CameraMode]()
        modes.append(.photo)
        modes.append(.video)
        if let _ = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back){
            modes.append(.portrait)
        }
        if #available(iOS 11.0, *){
            modes.append(.slowMotion)
        }
        modes.append(.panorama)
        return modes
    }
    
    func getReecentImage() -> UIImage? {
        DBManager.gerRecentImage()
    }
    
     

}
