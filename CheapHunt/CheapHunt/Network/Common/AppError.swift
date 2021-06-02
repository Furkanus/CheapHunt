//
//  AppError.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 5/31/21.
//

import Foundation

public enum AppError : Error {
    case custom(description : String?)
    case unknown
    
}
