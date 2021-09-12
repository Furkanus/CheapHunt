//
//  WidgetServiceProtocol.swift
//  CheapExtension
//
//  Created by Furkan Hanci on 7/19/21.
//

import Foundation


protocol WidgetServiceProtocol {
    func getWidgetData(price : Int? , completion : @escaping ([GameModel]) -> Void)
}
