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

class ExampleViewController: UIViewController {
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    var model = Model()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.collectionView)
        self.collectionView.frame = self.view.frame
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])

        self.addShuffleButton()
        self.addReloadButton()
    }

    // MARK: Actions

    @objc
    func shuffle() {
        self.model.shuffle()
    }

    func reload() {
        assertionFailure("override in subclass")
    }

    func reset() {
        self.model = Model()
    }

    func removeAll() {
        self.model = Model(people: [], colors: [])
    }

    func deleteItem(id: UniqueIdentifier) {
        self.model.delete(id: id)
    }

    func toggleFavorite(id: UniqueIdentifier) {
        self.model.toggleFavorite(id: id)
    }

    // MARK: Helpers

    private func appendRightBarButton(_ item: UIBarButtonItem) {
        var items = self.navigationItem.rightBarButtonItems ?? []
        items.append(item)
        self.navigationItem.rightBarButtonItems = items
    }

    private func addShuffleButton() {
        let item = UIBarButtonItem(systemImage: "shuffle", target: self, action: #selector(shuffle))
        self.appendRightBarButton(item)
    }

    private func addReloadButton() {
        let reload = UIAction(title: "Reload") { [unowned self] _ in
            self.reload()
        }

        let reset = UIAction(title: "Reset", attributes: .destructive) { [unowned self] _ in
            self.reset()
        }

        let removeAll = UIAction(title: "Remove All", attributes: .destructive) { [unowned self] _ in
            self.removeAll()
        }

        let menu = UIMenu(children: [reload, reset, removeAll])
        let item = UIBarButtonItem(systemItem: .refresh, primaryAction: nil, menu: menu)
        self.appendRightBarButton(item)
    }
}
