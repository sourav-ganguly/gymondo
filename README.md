# gymondo 

## How to Install
- The project should be open and run. Only dependency is KingFisher with I used with Swift Package Manager

## Time I worked in
Around 10-12 Hours 

## Features:
- Network Layer
- Exercise List View
- Exercise Detail View
- Exercise Detail Images 
- Exerise Detail Variations 
- Combine for reactinve coupleing between ViewModel and View

## Architecture
- MVVM with Coordinator Pattern
- Dependency Injection for Loose Coupling of between classes.
- Testable Class Design

## Not Implemented features
Due to business from my end it would have been very hard to implement all the features. I did not implement the following features:
- Unit test
- Lazy loading
- No Error handling and Loading view
- Only UIKit because I am not yet proficient in SwiftUI

## Issue
- There is one Constraint Mismatch issue in ExerciseDetailVeriationTableViewCell. I checked and all the constraints seems alright. The issue can be fixed if I delete the height of the imageview. But I wanted to the image view to have a fixed height.
