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

import UIKit

final class PlanetViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var moonsLabel: UILabel!

    let planet: PlanetModel

    init(planet: PlanetModel) {
        self.planet = planet
        super.init(nibName: "\(PlanetViewController.self)", bundle: nil)
        self.title = "Planet"
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = self.planet.name
        self.positionLabel.text = positionString(from: self.planet.position)
        self.moonsLabel.text = moonsString(from: self.planet.numberOfMoons)
    }

    private func positionString(from number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal

        guard let ordinalString = formatter.string(from: NSNumber(value: number)) else { return "" }
        return "\(ordinalString) from the Sun"
    }

    private func moonsString(from amount: Int) -> String {
        return if amount == 1 {
            "\(self.planet.numberOfMoons) moon"
        }
        else {
            "\(self.planet.numberOfMoons) moons"
        }
    }
}
