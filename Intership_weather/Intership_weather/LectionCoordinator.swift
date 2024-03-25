//
//  LectionCoordinator.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import UIKit


struct LectionFlowContext {

}

final class LectionCoordinator {

    // MARK: - Private properties

    private let navigationController: UINavigationController
    private let flowContext: LectionFlowContext

    private var favoritesViewController: UIViewController?

    // MARK: - Init

    init(navigationController: UINavigationController, flowContext: LectionFlowContext) {
        self.navigationController = navigationController
        self.flowContext = flowContext
    }

    // MARK: - Flow

    func start() {
        showProfile()
    }

    func finish() {
        favoritesViewController?.dismiss(animated: true)
    }
}

private extension LectionCoordinator {
    func showProfile() {
        let profileViewContoller = ProfileAssembler.assemble(moduleOutput: self)
        navigationController.pushViewController(profileViewContoller, animated: true)
    }

    func showFavorites() {
        let container = FavoritesContainer.assemble(with: .init())
        let favoritesViewController = container.viewController
        self.favoritesViewController = favoritesViewController
        navigationController.present(favoritesViewController, animated: true)
    }
}

extension LectionCoordinator: ProfileModuleOutput {
    func didRequestToOpenFavorites() {
        navigationController.popViewController(animated: true)
        showFavorites()
    }
}
