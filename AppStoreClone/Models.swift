//
//  Models.swift
//  AppStoreClone
//
//  Created by Weijie Lin on 1/10/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

struct FeaturedApps: Decodable {
    let bannerCategory: AppCategory
    let categories: [AppCategory]
}

struct AppCategory: Decodable {
    
    var name: String?
    var apps: [App]?
    var type: String?
    
    static func fetchFeaturedApps(completionHandler: @escaping ([AppCategory]) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, err) in
            
            if err != nil {
                print(err ?? "")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let featuredApps = try JSONDecoder().decode(FeaturedApps.self, from: data)

                let appCategories = featuredApps.categories
                
                DispatchQueue.main.async {
                    completionHandler(appCategories)
                }

            } catch let jsonErr {
                print(jsonErr)
            }
            
            
        }.resume()
    }
    
//    static func sampleAppCategories() -> [AppCategory] {
//        var bestNewAppsCategory = AppCategory()
//        bestNewAppsCategory.name = "Best New Apps"
//
//        var apps = [App]()
//
//        var frozenApp = App()
//        frozenApp.name = "Disney Build It: Frozen"
//        frozenApp.imageName = "frozen"
//        frozenApp.category = "Entertainment"
//        frozenApp.price = 3.99
//
//        apps.append(frozenApp)
//        bestNewAppsCategory.apps = apps
//
//        var bestNewGamesCategory = AppCategory()
//        bestNewGamesCategory.name = "Best New Games"
//
//        var bestNewGamesApps = [App]()
//
//        var telepaintApp = App()
//        telepaintApp.name = "Telepaint"
//        telepaintApp.imageName = "telepaint"
//        telepaintApp.category = "Games"
//        telepaintApp.price = 2.99
//
//        bestNewGamesApps.append(telepaintApp)
//        bestNewGamesCategory.apps = bestNewGamesApps
//
//        return [bestNewAppsCategory, bestNewGamesCategory]
//    }
}

struct App: Decodable {
    let id: Int?
    let name: String?
    let category: String?
    let imageName: String?
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        /*
             Id": 1,
             "Name": "Disney Build It: Frozen",
             "Category": "Entertainment",
             "Price": 3.99,
             "ImageName": "frozen"
        */
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case imageName = "ImageName"
        case price = "Price"
        
    }
}
