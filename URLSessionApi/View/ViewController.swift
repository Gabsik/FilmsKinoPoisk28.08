//
//  ViewController.swift
//  URLSessionApi
//
//  Created by User on 30.07.2023.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myTable = UITableView()
    var listFilms: [Doc] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        location()
        myTable.rowHeight = UITableView.automaticDimension
        myTable.estimatedRowHeight = 300.0
        myTable.separatorStyle = .none
        
        ApiManager.shared.filmsList { [weak self] values in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.listFilms = values
                self.myTable.reloadData()
            }
        }
    }
    
    func location() {
        view.addSubview(myTable)
        myTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        navigationItem.title = "Кино"
        myTable.register(TableViewCell.self, forCellReuseIdentifier: "myCell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFilms.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.configure(with: listFilms[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoFilmsVC = InfoFilms(filmInfo: listFilms[indexPath.row])
        navigationController?.pushViewController(infoFilmsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
