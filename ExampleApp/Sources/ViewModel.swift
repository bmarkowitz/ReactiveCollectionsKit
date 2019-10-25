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

enum ViewModel {

    static func makeCollectionViewModel(controller: UIViewController) -> ContainerViewModel {
        let people = Person.makePeople()

        let peopleCellViewModels = people.map { person in
            PersonCollectionCellViewModel(person: person, didSelect: {
                let personVC = PersonViewController(person: person)
                controller.navigationController?.pushViewController(personVC, animated: true)
            })
        }

        let section = SectionViewModel(cells: peopleCellViewModels)

        return ContainerViewModel(sections: [section])
    }

    static func makeTableViewModel(controller: UIViewController) -> ContainerViewModel {
        let people = Person.makePeople()

        let peopleCellViewModels = people.map { person in
            PersonTableCellViewModel(person: person, didSelect: {
                let personVC = PersonViewController(person: person)
                controller.navigationController?.pushViewController(personVC, animated: true)
            })
        }

        let section = SectionViewModel(cells: peopleCellViewModels)

        return ContainerViewModel(sections: [section])
    }
}
