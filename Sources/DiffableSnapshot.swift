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
import UIKit

typealias DiffableSnapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>
typealias DiffableSectionSnapshot = NSDiffableDataSourceSectionSnapshot<AnyHashable>

extension DiffableSnapshot {
    init(viewModel: CollectionViewModel) {
        self.init()

        let allSectionIdentifiers = viewModel.sections.map(\.id)
        self.appendSections(allSectionIdentifiers)

        viewModel.sections.forEach {
            let allCellIdentifiers = $0.cells.map(\.id)
            self.appendItems(allCellIdentifiers, toSection: $0.id)
        }
    }
}

extension DiffableSectionSnapshot {
    init(viewModel: SectionViewModel) {
        self.init()

        let allCellIdentifiers = viewModel.cells.map(\.id)
        self.append(allCellIdentifiers)

        viewModel.cells.forEach { cell in
            appendAllChildren(from: cell, to: cell.id)
        }
    }

    private mutating func appendAllChildren(from cell: AnyCellViewModel, to parentId: AnyHashable) {
        let childIdentifiers = cell.children.map(\.id)

        guard childIdentifiers.isNotEmpty else { return }

        self.append(childIdentifiers, to: parentId)

        for child in cell.children {
            appendAllChildren(from: child, to: child.id)
        }
    }
}
