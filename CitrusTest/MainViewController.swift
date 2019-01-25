//
//  MainViewController.swift
//  CitrusTest
//
//  Created by 1 on 19.01.19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit
import Alamofire

public class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let global = Global()
    
    var logoutButton = UIButton()
    var textArray = [All]()
 
    override public func viewDidLoad() {
        super.viewDidLoad()
        //Getting data and parsing received JSON
        request("https://cat-fact.herokuapp.com/facts").responseData { response in
            let json = response.data
            do {
                let data = try JSONDecoder().decode(Data.self, from: json!)
                self.textArray = data.all
            } catch
                let error {
                print(error)
            }
                    self.tableView.reloadData()
                    }
        
        self.setLogoutButton()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "custom")
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count

    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! TableViewCell
        
        if let firstName = self.textArray[indexPath.row].user?.name.first {
            if let lastName = self.textArray[indexPath.row].user?.name.last {
                let fullName = "\(firstName) \(lastName)"
                cell.nameLabel.text = fullName.capitalized
            }
        }
        cell.factTextView.text = self.textArray[indexPath.row].text
        return cell
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setLogoutButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(logout))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    @objc private func logout() {
        self.global.defaults.set(false, forKey: "userIsLoggedIn")
        self.performSegue(withIdentifier: "logout", sender: nil)
    }

}
