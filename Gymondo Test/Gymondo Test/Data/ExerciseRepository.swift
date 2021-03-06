//
//  ExerciseRepository.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 30/4/22.
//

import Foundation

protocol ExerciseRepository {
    func getExercises(completion: @escaping (Result<ExerciseList,Error>) -> Void)
    func getExerciseInfo(id: Int, completion: @escaping (Result<ExerciseInfo, Error>) -> Void)
}

class ExerciseRepositoryImpl: ExerciseRepository {
    let networking = Netwrking()
    func getExercises(completion: @escaping (Result<ExerciseList, Error>) -> Void) {
        return networking.fetchData(urlString: "https://wger.de/api/v2/exercise/",
                                    completion: completion)
    }
    
    func getExerciseInfo(id: Int, completion: @escaping (Result<ExerciseInfo, Error>) -> Void) {
        return networking.fetchData(urlString: "https://wger.de/api/v2/exerciseinfo/\(id)",
                                    completion: completion)
    }
}
