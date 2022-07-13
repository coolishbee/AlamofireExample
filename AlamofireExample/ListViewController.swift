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
    let demos = ["Login", "Auto Login", "TEST"]

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
            let id_token = "id_token"
            let reqLogin = ReqLogin(deviceID: Helpers.getDeviceId(),
                                    loginToken: id_token,
                                    loginType: "google")
            
            APIClient.login(reqLogin) { result in
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
        } else if indexPath.row == 1 {
            let session_key = "CK5TFBFPCPPWMSIO6DLILSG6HVNRVSKPWPUGO2DPH6TV6NFKM4TQ"
            APIClient.autoLogin(sessionKey: session_key) { result in
                switch result {
                case .success(let respLogin):
                    let resJSON = toJSON(respLogin)
                    let vc = BasicUIScrollViewController()
                    vc.label.text = resJSON
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure(let error):
                    print(error)
                }
            }
            
        } else if indexPath.row == 2 {
            let viewController = BasicUIScrollViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
        
}
