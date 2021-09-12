//
//  ViewController.swift
//  DemoProject
//
//  Created by sowmya P on 12/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        self.startButtonOutlet.isHidden = true
        self.getHttpRequest()
        
    }
    func getHttpRequest() {
        //Running an HTTP get request on background thread serially
        DispatchQueue.global(qos: .background).sync {
            for urlString in self.viewModel.url {
                if let url = URL(string: urlString)  {
                    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                        self.viewModel.httpResponse = response as? HTTPURLResponse
                        if error == nil {
                            guard let data = data else { return }
                            self.viewModel.sizesArray.append(self.viewModel.getSize(data: data))
                            print(String(data: data, encoding: .utf8)!)
                            // Updating UI on main thread
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }else {
                            if let httpResponse = response as? HTTPURLResponse {
                                self.viewModel.sizesArray.append("\(httpResponse.statusCode)")
                            }
                            
                        }
                    }
                    
                    
                    task.resume()
                }
                
            }
            
        }
    }
    func registerCell() {
        self.tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ListCell")
        self.tableView.register(ListHeaderView.self, forHeaderFooterViewReuseIdentifier: "ListHeaderView")
    }
    func showURLContents(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "ListCell") as? ListCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.displayData(viewModel: self.viewModel, index: indexPath.row)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showURLContents(urlString: self.viewModel.url[indexPath.row])
    }
    
}
