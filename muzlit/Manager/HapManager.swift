//
//  HapManager.swift
//  muzlit
//
//  Created by Anton Tuzov on 25.02.2021.
//

import Foundation
import UIKit

final class HapManager {
    
    
    
    static let shared = HapManager()

    private init() {}

    public func vibrateForSelection() {
        DispatchQueue.main.async {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }

    public func vibrate(for type: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
        }
    }
}
