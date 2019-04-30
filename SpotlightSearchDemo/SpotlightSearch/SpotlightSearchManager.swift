//
//  SpotlightSearchManager.swift
//  SpotlightSearchDemo
//
//  Created by Yiyin Shen on 30/4/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import Foundation
import UIKit
import CoreSpotlight
import MobileCoreServices

class SpotlightSearchManager {
    func indexSearchableItems(){

        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }

    func deleteSearchableItems(with domainIdentifiers: [String]) {
        CSSearchableIndex.default().deleteSearchableItems(withDomainIdentifiers: domainIdentifiers) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }

    private var searchableItemModels: [SportlightSearchItemModel] {
        return [
            SportlightSearchItemModel(title: "Red Pear", description: "This is a red pear", thumbnail: "pear_red", uniqueIdentifier: "RedPear", domainIdentifier: "Pear"),
            SportlightSearchItemModel(title: "Blue Pear", description: "This is a blue pear", thumbnail: "pear_blue", uniqueIdentifier: "BluePear", domainIdentifier: "Pear"),
            SportlightSearchItemModel(title: "Red Banana", description: "This is a red banana", thumbnail: "banana_red", uniqueIdentifier: "RedBanana", domainIdentifier: "Banana"),
            SportlightSearchItemModel(title: "Blue Banana", description: "This is a blue banana", thumbnail: "banana_blue", uniqueIdentifier: "BlueBanana", domainIdentifier: "Banana"),
        ]
    }

    private var searchableItems: [CSSearchableItem] {
        var items = [CSSearchableItem]()
        for model in searchableItemModels {
            let searchItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            searchItemAttributeSet.title = model.title
            searchItemAttributeSet.contentDescription = model.description
            searchItemAttributeSet.thumbnailData = UIImage(named: model.thumbnail)?.pngData()
            let item = CSSearchableItem(uniqueIdentifier: model.uniqueIdentifier, domainIdentifier: model.domainIdentifier, attributeSet: searchItemAttributeSet)
            items.append(item)
        }
        return items
    }
}
