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
    func didSelectCell(index: Int)
    func viewDidLoad()
}


class ExerciseDetailViewModelImpl: ExerciseDetailViewModel {
    
    
    let exerciseRepository: ExerciseRepository = ExerciseRepositoryImpl()
    weak var coordinator: AppCoordinator!

    @Published var exerciseInfo: ExerciseInfo? = nil
    var exerciseInfoPublisher: Published<ExerciseInfo?>.Publisher  { $exerciseInfo }
    
    func didSelectCell(index: Int) {
        
    }
    
    func viewDidLoad() {
        exerciseRepository.getExerciseInfo(id: 220) { [weak self] result in
            switch result {
            case .success(let exercisesInfo):
                self?.exerciseInfo = exercisesInfo
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}
