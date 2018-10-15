//
//  MainViewController.swift
//  GitHub App
//
//  Created by KBL on 01/10/2018.
//  Copyright © 2018 KBL. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var presenter : MainPresenterContract?
    
    var repositories: [RepositorieVO] = []
    var user = UserVO()
    var cellSelected = RepositorieVO()
    
    var orientationRatio = 1.0
    
    // MARK: - Inherit
    
    override func viewDidLoad() {
        log.verbose()
        super.viewDidLoad()
        self.navigationItem.title = "collection";
        let logoutButton = UIBarButtonItem(image: UIImage(named: "baseline_power_settings_new_black_18dp"), style: .plain, target: self, action: #selector(didLogout))
        navigationItem.setRightBarButton(logoutButton, animated: true)
        self.presenter = MainPresenter(delegate: self)
        initCollectionView()
        presenter?.getData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        log.verbose()
        if(segue.identifier == "cellSelected") {
            let detailViewController = segue.destination as! DetailViewController;
            detailViewController.user = user
            detailViewController.repositorie = cellSelected
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        log.verbose()
        super.viewWillTransition(to: size, with: coordinator)
        if(UIDevice.current.orientation.isPortrait) {
            orientationRatio = 1.0
        } else {
            orientationRatio = 2.1
        }
    }
    
    // MARK: - Action
    
    @objc
    private func didLogout() {
        log.verbose()
        UserDefaultUtils.setUser(toLog: false, name: "", avatarUrl: "")
        AppDelegate.shared.rootViewController.switchToLogout()
    }
    
    private func loadRepositories(user: UserVO, repositories: [RepositorieVO]) {
        log.verbose()
        self.repositories = repositories
        self.user = user
    }
    
    // MARK: - Initialization
    
    private func initCollectionView() {
        log.verbose()
        self.collectionView.register(RepositorieCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView.register(UINib(nibName: "RepositorieCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}

// MARK: - MainViewContract
extension MainViewController: MainViewContract {
    func displayError(_ error: String) {
        //        self.displayLoader(false)
        print(error)
    }
    
    func restituteRepositories(user: UserVO, repositories: [RepositorieVO]) {
        log.verbose()
        loadRepositories(user: user, repositories: repositories)
        collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        log.verbose()
        return repositories.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        log.verbose()
        let cell: RepositorieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RepositorieCell
        let cellule = repositories[indexPath.row]
        cell.repository = cellule
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        log.verbose()
        self.cellSelected = repositories[indexPath.row]
        self.performSegue(withIdentifier: "cellSelected", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        log.verbose()
        return CGSize(width: collectionView.frame.size.width / CGFloat(orientationRatio), height: 100)
    }
}
