//
//  ExerciseDetailViewModel.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 2/5/22.
//

import Foundation
import Combine

protocol ExerciseDetailViewModel {
    
    var exerciseInfoPublisher: Published<ExerciseInfo?>.Publisher  { get }
    func didSelectVariation(index: Int)
    func viewDidLoad()
}


class ExerciseDetailViewModelImpl: ExerciseDetailViewModel {
    
    let exerciseRepository: ExerciseRepository = ExerciseRepositoryImpl()
    weak var coordinator: AppCoordinatorOutput!
    let exerciseId: Int

    @Published var exerciseInfo: ExerciseInfo? = nil
    var exerciseInfoPublisher: Published<ExerciseInfo?>.Publisher  { $exerciseInfo }
    
    func didSelectVariation(index: Int) {
        if let exerciseId = exerciseInfo?.variations[index] {
            coordinator.navigateToExerciseDetail(id: exerciseId)
        }
    }
    
    func viewDidLoad() {
        exerciseRepository.getExerciseInfo(id: exerciseId) { [weak self] result in
            switch result {
            case .success(let exercisesInfo):
                self?.exerciseInfo = exercisesInfo
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(id: Int, coordinator: AppCoordinator) {
        self.exerciseId = id
        self.coordinator = coordinator
    }
}
