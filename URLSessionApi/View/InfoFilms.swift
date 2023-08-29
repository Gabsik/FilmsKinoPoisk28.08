//
//  InfoFilms.swift
//  URLSessionApi
//
//  Created by User on 13.08.2023.
//
import UIKit
import SnapKit
import Kingfisher

class InfoFilms: UIViewController {
    let tableView = UITableView()
    let filmInfo: Doc
    
    init(filmInfo: Doc) {
        self.filmInfo = filmInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }
    private func setupe() {
        view.addSubview(tableView)
        constraints()
        registorCell()
        settingTableView()
    }
    
    private func constraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func registorCell() {
        tableView.register(InfoFilmsCell.self, forCellReuseIdentifier: "InfoFilmsCell")
        tableView.register(ShortDescriptionCell.self, forCellReuseIdentifier: "ShortDescriptionCell")
        tableView.register(RatingViewCell.self, forCellReuseIdentifier: "RatingViewCell")
    }
    private func settingTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
}
extension InfoFilms: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoFilmsCell", for: indexPath) as! InfoFilmsCell
            cell.configure(with: filmInfo)
            return cell
            
        }else if indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "ShortDescriptionCell") as! ShortDescriptionCell
            cell1.configure(with: filmInfo)
            return cell1
        } else if indexPath.row == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "RatingViewCell") as! RatingViewCell
            cell2.configure(with: filmInfo)
            return cell2
        }
        return UITableViewCell()
    }
}
