//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//
//  Documentation
//  https://jessesquires.github.io/DiffableCollectionsKit
//
//
//  GitHub
//  https://github.com/jessesquires/DiffableCollectionsKit
//
//
//  License
//  Copyright © 2019-present Jesse Squires
//  Released under an MIT license: https://opensource.org/licenses/MIT
//

import UIKit
import DiffableCollectionsKit

struct PersonCollectionCellViewModel: CellViewModel {
    let person: Person

    let didSelect: CellActions.DidSelect

    let registration = ReusableViewRegistration(classType: PersonCollectionCell.self,
                                                nibName: "CollectionCell",
                                                bundle: nil)

    func size<V: UIView & CellContainerViewProtocol>(in containerView: V) -> CGSize {
        let collection = containerView as! UICollectionView
        return collection.uniformCellSize()
    }

    func applyViewModelTo(cell: Self.CellType) {
        let cell = cell as! PersonCollectionCell
        cell.titleLabel.text = self.person.name
        cell.subtitleLabel.text = self.person.birthDateText
        cell.flagLabel.text = self.person.nationality
    }
}