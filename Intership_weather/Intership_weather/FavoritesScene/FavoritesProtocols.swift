//
//  FavoritesProtocols.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

protocol FavoritesModuleInput {
    var moduleOutput: FavoritesModuleOutput? { get }
}

protocol FavoritesModuleOutput: AnyObject {
}

protocol FavoritesViewInput: AnyObject {
}

protocol FavoritesViewOutput: AnyObject {
}

protocol FavoritesInteractorInput: AnyObject {
}

protocol FavoritesInteractorOutput: AnyObject {
}

protocol FavoritesRouterInput: AnyObject {
}
