//
//  SettingsModels.swift
//  muzlit
//
//  Created by turbo on 27.02.2021.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}

