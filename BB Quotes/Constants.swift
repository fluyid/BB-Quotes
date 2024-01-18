//
//  Constants.swift
//  BB Quotes
//
//  Created by Kailash Nath on 18/01/2024.
//
// Lesson 4

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
