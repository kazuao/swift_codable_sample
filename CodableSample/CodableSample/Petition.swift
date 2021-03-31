//
//  Petition.swift
//  CodableSample
//
//  Created by Kazunori Aoki on 2021/03/31.
//

import Foundation

class Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
