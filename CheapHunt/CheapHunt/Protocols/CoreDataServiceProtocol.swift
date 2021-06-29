//
//  CoreDataServiceProtocol.swift
//  CheapHunt
//
//  Created by Furkan Hanci on 6/29/21.
//

import Foundation
import CoreData

protocol CoreDataService {
    func saveData(with context : NSManagedObjectContext)
}
