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

import ReactiveCollectionsKit
import UIKit

struct PlanetCellViewModelGrid: CellViewModel {
    let planet: PlanetModel

    // MARK: CellViewModel

    var id: UniqueIdentifier { self.planet.id }

    let contextMenuConfiguration: UIContextMenuConfiguration?

    func configure(cell: GridColorCell) {
        cell.label.text = self.planet.name
        cell.contentView.backgroundColor = .systemGroupedBackground
    }

    // MARK: Hashable

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.planet)
    }

    static func == (left: Self, right: Self) -> Bool {
        left.planet == right.planet
    }
}
