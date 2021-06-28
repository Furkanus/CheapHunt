//
//  CheapError.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/28/21.
//

import Foundation


enum CheapError : String , Error {
    case genericError = "Generic error"
      case decodingError = "Decoding error"
      case encodingError = "Encoding error"
      case writingError = "Writing error"
      case responseError = "Response error"
      case dataError = "Data error"
      case urlError = "Invalid URL"
}
