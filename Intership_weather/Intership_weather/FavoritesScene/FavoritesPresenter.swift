//
//  FavoritesPresenter.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

final class FavoritesPresenter {
    weak var view: FavoritesViewInput?
    weak var moduleOutput: FavoritesModuleOutput?
    
    private let router: FavoritesRouterInput
    private let interactor: FavoritesInteractorInput
    
    init(router: FavoritesRouterInput, interactor: FavoritesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension FavoritesPresenter: FavoritesModuleInput {
}

extension FavoritesPresenter: FavoritesViewOutput {
}

extension FavoritesPresenter: FavoritesInteractorOutput {
}

