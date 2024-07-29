//
//  TableViewController.swift
//  tableViewAnimation
//
//  Created by Saadet Şimşek on 29/07/2024.
//

import UIKit

class TableViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "List"
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableView()
    }

    private func animateTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
            let cells = self.tableView.visibleCells
            let tableViewHeight = self.tableView.bounds.height
            var delay: Double = 0
            
            for cell in cells {
                cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
                
                UIView.animate(withDuration: 1.5,
                               delay: delay * 0.05,
                               usingSpringWithDamping: 0.8,
                               initialSpringVelocity: 0,
                               options: .curveEaseInOut) {
                    cell.transform = CGAffineTransform.identity
                }
                delay += 1
            }
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Saadet 🩶"
        return cell
    }
}
