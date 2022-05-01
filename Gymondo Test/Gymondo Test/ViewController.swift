//
//  ViewController.swift
//  Gymondo Test
//
//  Created by Sourav Ganguly on 30/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    let experciseRepository = ExerciseRepositoryImpl()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        experciseRepository.getExercises { result in
            print(result)
        }
    }


}

