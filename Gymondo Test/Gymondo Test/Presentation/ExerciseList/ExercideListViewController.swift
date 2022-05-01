//
//  ExercideListViewController.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 1/5/22.
//

import UIKit

class ExerciseListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        print("ExerciseListViewController view did load")
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: .exerciseCellName, bundle: nil), forCellReuseIdentifier: .exerciseCellName)
    }

}

extension ExerciseListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: .exerciseCellName) as! ExerciseTableViewCell
        return cell
    }
}

private extension String {
    static let exerciseCellName = "ExerciseTableViewCell"
}
