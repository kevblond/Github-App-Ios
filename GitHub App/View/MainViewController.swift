//
//  MainViewController.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var presenter : MainPresenterContract?
    
    var repositories = ["Cell1","Cell2","Cell3","Cell4","Cell5"]
    var user = String()
    var cellSelected = String()
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = user;
        let logoutButton = UIBarButtonItem(image: UIImage(named: "baseline_power_settings_new_black_18dp"), style: .plain, target: self, action: #selector(didLogout))
        navigationItem.setRightBarButton(logoutButton, animated: true)
        self.presenter = MainPresenter(delegate: self)
        presenter?.getRepositories()
        initTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        log.verbose()
        if(segue.identifier == "cellSelected") {
            let detailViewController = segue.destination as! DetailViewController;
            detailViewController.descriptionRep = cellSelected;
            detailViewController.nameRepositorie = cellSelected;
        }
    }
    
    // MARK: - Action
    
    @objc
    private func didLogout() {
        log.verbose()
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        AppDelegate.shared.rootViewController.switchToLogout()
    }
    
    // MARK: - Initialization
    
    private func initTableView () {
        self.tableView.register(RepositorieCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(UINib(nibName: "RepositorieCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.tableView.estimatedRowHeight = 20
        self.tableView.rowHeight = 100
    }
}

extension MainViewController: MainViewContract {
    func displayError(_ error: String) {
        //        self.displayLoader(false)
        print(error)
    }
    
    func restituteRepositories(user: String, repositories: [String]) {
        log.verbose(repositories)
        self.repositories = repositories
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositorieCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositorieCell
        
        let cellule = repositories[indexPath.row];
        cell.setCell(name: cellule, path: cellule, numberView: cellule, language: cellule)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellSelected = repositories[indexPath.row]
        self.performSegue(withIdentifier: "cellSelected", sender: self)
    }
}
