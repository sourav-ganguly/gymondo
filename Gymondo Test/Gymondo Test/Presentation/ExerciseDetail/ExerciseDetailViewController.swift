//
//  ExerciseDetailViewController.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 2/5/22.
//

import UIKit
import Combine

class ExerciseDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: ExerciseDetailViewModel!
    private var cancellables: Set<AnyCancellable> = []
    private var exerciseTitle: String = ""
    private var imageUrls: [String] = []
    private var nVariations: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = .title
        configureTableView()
        viewModel.viewDidLoad()

        viewModel.exerciseInfoPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] exerciseInfo in
                self?.exerciseTitle = exerciseInfo?.name ?? ""
                self?.imageUrls = (exerciseInfo?.images.map { $0.image }) ?? []
                self?.nVariations = exerciseInfo?.variations.count ?? 0
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: .exerciseDetailTitleTableViewCell, bundle: nil),
                           forCellReuseIdentifier: .exerciseDetailTitleTableViewCell)
        tableView.register(UINib(nibName: .exerciseDetailImageTableViewCell, bundle: nil),
                           forCellReuseIdentifier: .exerciseDetailImageTableViewCell)
        tableView.register(UINib(nibName: .exerciseDetailVeriationTableViewCell, bundle: nil),
                           forCellReuseIdentifier: .exerciseDetailVeriationTableViewCell)
        
    }
}

extension ExerciseDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count + nVariations + 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.row) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: .exerciseDetailTitleTableViewCell) as! ExerciseDetailTitleTableViewCell
            cell.configureWith(title: exerciseTitle)
            return cell
        case 0...imageUrls.count:
            let cell = tableView.dequeueReusableCell(withIdentifier: .exerciseDetailImageTableViewCell) as! ExerciseDetailImageTableViewCell
            cell.configureWith(stringUrl: imageUrls[indexPath.row - 1])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: .exerciseDetailVeriationTableViewCell) as! ExerciseDetailVeriationTableViewCell
            cell.configureWith(name: "Variation: \(indexPath.row - imageUrls.count - 1)")
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row > imageUrls.count) {
            viewModel.didSelectVariation(index: indexPath.row - imageUrls.count - 1)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


fileprivate extension String {
    static let title = "Exercise Detail"
    static let exerciseDetailTitleTableViewCell = "ExerciseDetailTitleTableViewCell"
    static let exerciseDetailImageTableViewCell = "ExerciseDetailImageTableViewCell"
    static let exerciseDetailVeriationTableViewCell = "ExerciseDetailVeriationTableViewCell"
}
