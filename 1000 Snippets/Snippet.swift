//
//  Snippet.swift
//  1000 Snippets
//
//  Created by Luciano Sclovsky on 06/04/19.
//  Copyright © 2019 Luciano Sclovsky. All rights reserved.
//

import Foundation

struct Snippet {
    let id: Int
    let title: String
    let code: [String]
    
    init(_ id: Int, _ title: String, _ code: [String] = []) {
        self.id = id
        self.title = title
        self.code = code
    }
}
