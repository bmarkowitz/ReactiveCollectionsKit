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

struct Model {
    private(set) var people = PersonModel.makePeople()

    private(set) var colors = ColorModel.makeColors()

    private(set) var planets = PlanetModel.makePlanets()

    private(set) var gridSections: [GridSection] = GridSection.allCases

    mutating func shuffle() {
        self.people.shuffle()
        self.colors.shuffle()
        self.planets.shuffle()
    }

    mutating func delete(id: UniqueIdentifier) {
        if let index = self.people.firstIndex(where: { $0.id == id }) {
            self.people.remove(at: index)
        }
        if let index = self.colors.firstIndex(where: { $0.id == id }) {
            self.colors.remove(at: index)
        }
        if let index = self.planets.firstIndex(where: { $0.id == id }) {
            self.planets.remove(at: index)
        }

        updateSections()
    }

    mutating func toggleFavorite(id: UniqueIdentifier) {
        if let index = self.people.firstIndex(where: { $0.id == id }) {
            self.people[index].isFavorite.toggle()
        }
        if let index = self.colors.firstIndex(where: { $0.id == id }) {
            self.colors[index].isFavorite.toggle()
        }
        if let index = self.planets.firstIndex(where: { $0.id == id }) {
            self.planets[index].isFavorite.toggle()
        }
    }

    private mutating func updateSections() {
        self.gridSections = []

        if !self.people.isEmpty {
            self.gridSections.append(.people)
        }
        if !self.colors.isEmpty {
            self.gridSections.append(.colors)
        }
        if !self.planets.isEmpty {
            self.gridSections.append(.planets)
        }
    }
}

extension Model: CustomDebugStringConvertible {
    var debugDescription: String {
        let peopleNames = self.people.map(\.name).joined(separator: "\n\t")
        let colorNames = self.colors.map(\.name).joined(separator: "\n\t")
        let planetNames = self.planets.map(\.name).joined(separator: "\n\t")
        return """
        People:
            \(peopleNames)

        Colors:
            \(colorNames)
        
        Planets:
            \(planetNames)
        """
    }
}

extension Model {
    enum GridSection: CaseIterable {
        case people
        case colors
        case planets
    }
}
