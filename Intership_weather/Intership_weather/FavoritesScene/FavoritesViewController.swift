//
//  FavoritesViewController.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import UIKit

final class FavoritesViewController: UIViewController {
    private let output: FavoritesViewOutput

    init(output: FavoritesViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
    }
}

extension FavoritesViewController: FavoritesViewInput {
}
