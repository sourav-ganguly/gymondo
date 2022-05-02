//
//  ExercideListViewController.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import UIKit
import Combine

class ExerciseListViewController: UIViewController {
    
    var viewModel: ExercideListViewModel!
    var exerciseViewModelList: [ExerciseCellViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .title
        configureTableView()
        viewModel.viewDidLoad()

        viewModel.exerciseListPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] viewModelList in
                self?.exerciseViewModelList = viewModelList
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: .exerciseCellName, bundle: nil),
                           forCellReuseIdentifier: .exerciseCellName)
    }

}

extension ExerciseListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseViewModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .exerciseCellName) as! ExerciseTableViewCell
        cell.configureWith(viewModel: exerciseViewModelList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectCell(index: indexPath.row)
    }
}

private extension String {
    static let exerciseCellName = "ExerciseTableViewCell"
    static let title = "Exercise List"
}
