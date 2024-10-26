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

enum HeaderViewStyle: Hashable {
    case large
    case small
}

struct HeaderViewModel: SupplementaryHeaderViewModel {
    let title: String
    let style: HeaderViewStyle

    // MARK: SupplementaryViewModel

    var id: UniqueIdentifier { self.title }

    func configure(view: UICollectionViewListCell) {
        var config: UIListContentConfiguration
        switch self.style {
        case .large:
            config = .prominentInsetGroupedHeader()
            config.directionalLayoutMargins = .init(top: 8, leading: 8, bottom: 8, trailing: 8)

        case .small:
            config = .groupedHeader()
        }
        config.text = self.title
        view.contentConfiguration = config
    }
}
