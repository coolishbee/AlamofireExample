//
//  ListViewController.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/02/25.
//

import UIKit
import SnapKit
import Alamofire

class ListViewController: UITableViewController {

    let kCellIdentifier = "CellIdentifier"
    let demos = ["GET", "POST 1", "POST 2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Alamofire iOS Demos"
        
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)! as UITableViewCell
        
        cell.textLabel?.text = demos[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else if indexPath.row == 1 {
            let id_token = "id_token"
            
            APIClient.login(type: "google", token: id_token) { result in
                switch result {
                case .success(let respLogin):
                    
                    let resJSON = toJSON(respLogin)
                    
                    let viewController = BasicUIScrollViewController()
                    viewController.label.text = resJSON
                    //print(resJSON ?? "nil")
                                        
                    self.navigationController?.pushViewController(viewController, animated: true)
                case .failure(let error):
                    
                    print(error)
                }
            }
            
            //let viewController = BasicUIScrollViewController()
            //navigationController?.pushViewController(viewController, animated: true)
        } else if indexPath.row == 2 {
            let viewController = BasicUIScrollViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
        
}
