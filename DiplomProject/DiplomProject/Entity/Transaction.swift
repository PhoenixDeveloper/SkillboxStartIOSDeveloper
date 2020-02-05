//
//  Transaction.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import Foundation

protocol Transaction {
    var value: Float { get set }
    var date: Date { get }
}
