//
//  CameraViewModelProtocol.swift
//  MVVM Project
//
//  Created by Levan Gorjeladze on 20.02.23.
//

import UIKit

protocol CameraViewModelProtocol {
    var isFlashEnabled: Bool {get set}
    var isLivePhotoEnabled: Bool {get set}
    
    var isWideScreenAvailable: Bool {get}
    var isWideScreenEnabled: Bool { get set }
    var isCameraFlipAvilable: Bool {get}
    
    
    func getAvailableCameraModes() -> [CameraMode]
    func getReecentImage() -> UIImage?
    
}
