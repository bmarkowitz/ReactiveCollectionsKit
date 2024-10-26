//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://jessesquires.github.io/ReactiveCollectionsKit
//
//  GitHub
//  https://github.com/jessesquires/ReactiveCollectionsKit
//
//  Copyright © 2019-present Jesse Squires
//

import Foundation
import ReactiveCollectionsKit

struct PlanetModel: Hashable {
    let name: String
    let position: Int
    let numberOfMoons: Int
    var isFavorite = false

    var id: UniqueIdentifier {
        self.name
    }
}

extension PlanetModel {
    static func makePlanets() -> [PlanetModel] {
        [
            PlanetModel(name: "Mercury", position: 1, numberOfMoons: 0),
            PlanetModel(name: "Venus", position: 2, numberOfMoons: 0),
            PlanetModel(name: "Earth", position: 3, numberOfMoons: 1),
            PlanetModel(name: "Mars", position: 4, numberOfMoons: 2),
            PlanetModel(name: "Jupiter", position: 5, numberOfMoons: 95),
            PlanetModel(name: "Saturn", position: 6, numberOfMoons: 146),
            PlanetModel(name: "Uranus", position: 7, numberOfMoons: 28),
            PlanetModel(name: "Neptune", position: 8, numberOfMoons: 16),
        ]
    }
}
