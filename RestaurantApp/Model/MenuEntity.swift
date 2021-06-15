//
//  MenuEntity.swift
//  RestaurantApp
//
//  Created by Kalbek Saduakassov on 14.06.2021.
//

import Foundation

struct MenuEntity: Decodable {
    let result: [Entities]?
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
    
    struct Entities: Decodable {
        let images: [String]
        let id: String?
        let menuname: String?
        let description: String?

            enum CodingKeys: String, CodingKey {
                case images = "images"
                case id = "_id"
                case menuname = "menuname"
                case description = "description"
            }
            
            //            init(_ game: CoreDataEntity) {
            //                self.id = Int(game.id)
            //                self.title = game.title ?? ""
            //                self.box = nil
            //            }
            
            
        }
    }
    
