//
//  ExercideListViewModel.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import Foundation
import Combine

protocol ExercideListViewModel {
    var exerciseListPublisher: Published<[Exercise]>.Publisher  { get }
    func didSelectCell(index: Int)
    func viewDidLoad()
}


class ExercideListViewModelImpl: ExercideListViewModel {
    let exerciseRepository: ExerciseRepository = ExerciseRepositoryImpl()
    weak var coordinator: AppCoordinator!

    @Published var exerciseList: [Exercise] = []
    var exerciseListPublisher: Published<[Exercise]>.Publisher  { $exerciseList }
    
    func didSelectCell(index: Int) {
        coordinator.navigateToExerciseDetail(id: exerciseList[index].id)
    }
    
    func viewDidLoad() {
        exerciseRepository.getExercises { [weak self] result in
            switch result {
            case .success(let exercisesList):
                self?.exerciseList = exercisesList.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
}

extension Exercise: ExerciseCellViewModel {
    var title: String {
        name
    }
    
    var subtitle: String {
        resultDescription
    }
}
