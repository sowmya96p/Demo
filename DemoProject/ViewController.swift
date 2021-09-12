//
//  ViewController.swift
//  DemoProject
//
//  Created by sowmya P on 12/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    func registerCell() {
        self.tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
        self.tableView.register(ListHeaderView.self, forHeaderFooterViewReuseIdentifier: "ListHeaderView")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel.urls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.listText.text = self.viewModel.urls[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "CONTENTS"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        headerView.backgroundColor = .systemGroupedBackground
        headerView.addSubview(label)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
