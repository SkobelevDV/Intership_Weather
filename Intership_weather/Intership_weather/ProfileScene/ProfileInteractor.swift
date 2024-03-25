//
//  ProfileInteractor.swift
//  Intership_weather
//
//  Created by New on 24.03.2024.
//

import Foundation

final class ProfileInteractor {
    weak var output: ProfileInteractorOutput?
}

extension ProfileInteractor: ProfileInteractorInput {
    func loadProfile() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let profile = Profile(name: "Artur", email: "artur@vk.ru", status: "прогает на Бали")
            let result: Result<Profile, CustomError> = .success(profile) // .failure(.unknowError)
            self?.output?.didReceive(result: result)
        }
    }
}
