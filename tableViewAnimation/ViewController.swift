//
//  ViewController.swift
//  tableViewAnimation
//
//  Created by Saadet Şimşek on 29/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    let goToTableViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor =  #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.setTitle("Go To TableView", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self,
                         action: #selector(goToTableviewButtonTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        
        setupViews()
        
        setConstraints()
        
        
    }

    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(goToTableViewButton)
 
    }
    
    @objc func goToTableviewButtonTapped(){
        let vc = TableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            goToTableViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goToTableViewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goToTableViewButton.heightAnchor.constraint(equalToConstant: 60),
            goToTableViewButton.widthAnchor.constraint(equalToConstant: 240)
        ])
    }

}

