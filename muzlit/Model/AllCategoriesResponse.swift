//
//  File.swift
//  muzlit
//
//  Created by turbo on 01.03.2021.
//

import Foundation



struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
