//
//  ExerciseRepository.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 30/4/22.
//

import Foundation

protocol ExerciseRepository {
    func getExercises(completion: @escaping (Result<Int,Error>) -> Void)
}

class ExerciseRepositoryImpl: ExerciseRepository {
    let networking = Netwrking()
    func getExercises(completion: @escaping (Result<Int, Error>) -> Void) {
        return networking.fetchData(urlString: "https://my-json-server.typicode.com/thefabulous/fabtest-server/db", completion: completion)
    }
}
