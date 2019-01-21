//
//  MainViewController.swift
//  CitrusTest
//
//  Created by 1 on 19.01.19.
//  Copyright © 2019 Bogdan Magala. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var logoutButton = UIButton()
    let loginViewController = LoginViewController()
    var textArray = [All]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
     
        request("https://cat-fact.herokuapp.com/facts").responseData { response in
            let json = response.data
            do {
                let data = try? JSONDecoder().decode(Data.self, from: json!)
                self.textArray = (data?.all)!
            } catch
                let error {
            print(error)
            }
                    self.tableView.reloadData()
                    }
        
        setLogoutButton()

        navigationItem.hidesBackButton = true
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "custom")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! TableViewCell
        
        if let firstName = textArray[indexPath.row].user?.name.first {
            if let lastName = textArray[indexPath.row].user?.name.last {
                let fullName = "\(firstName) \(lastName)"
                cell.nameLabel.text = fullName.capitalized
            }
        }
        cell.factTextView.text = textArray[indexPath.row].text
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func setLogoutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    @objc func logout() {
        defaults.set(false, forKey: "userIsLoggedIn")
        print(defaults.bool(forKey: "userIsLoggedIn"))
        self.performSegue(withIdentifier: "logout", sender: nil)
    }

}
