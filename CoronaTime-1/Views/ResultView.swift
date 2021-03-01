//
//  ResultView.swift
//  CoronaTime-1
//
//  Created by Mehdi Abdi on 1/20/21.
//

import UIKit

class ResultView {
    
    var resultLabel: UILabel = {
       var result = UILabel()
        result.text = "Result is:"
        result.textColor = .orange
        result.font = UIFont.systemFont(ofSize: 40)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    func constraintResultView(_ view: UIView) {
        resultLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    }
}
