//
//  PlanAPIService.swift
//  PlanAPIService
//
//  Created by Jatin on 22/09/21.
//

import Foundation

struct PlanAPIService: JPAPIService {
    func getPlan(with planID: String,
                 completion: @escaping (Result<[BodyPart], Error>) -> Void) {
        Task {
            do {
                let data: [BodyPart] = try await networkManager.fetch(from: .plan(planID: planID))
                completion(Result.success(data))
            } catch {
                completion(Result.failure(error))
            }
        }
    }
}
