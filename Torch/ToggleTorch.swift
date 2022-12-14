//
//  ToggleTorch.swift
//  Torch
//
//  Created by Ming on 9/8/2022.
//

import SwiftUI
import AVFoundation

func toggleTorch(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }

    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            
            device.torchMode = on ? .on : .off

            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }
}
