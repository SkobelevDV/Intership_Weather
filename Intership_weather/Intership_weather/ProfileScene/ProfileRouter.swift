//
//  ProfileRouter.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

final class ProfileRouter {
    weak var viewController: ProfileViewController?
}

extension ProfileRouter: ProfileRouterInput {
    func openMain() {
        let container = FavoritesContainer.assemble(with: .init())
        viewController?.navigationController?.pushViewController(container.viewController, animated: true)
    }
}

