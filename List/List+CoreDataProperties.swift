//
//  List+CoreDataProperties.swift
//  List
//
//  Created by ios6 on 5/3/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import Foundation
import CoreData


extension List
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<List>
    {
        return NSFetchRequest<List>(entityName: "List");
    }
    @NSManaged public var clothes: String?
    @NSManaged public var subtitle: String?
}
