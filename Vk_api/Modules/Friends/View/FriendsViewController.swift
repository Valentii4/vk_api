//
//  FriendsViewController.swift
//  Vk_api
//
//  Created by Valentin Mironov on 09.07.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "FriendTableViewCell", bundle: Bundle(path:"Modules/Friends/View")), forCellReuseIdentifier: "FriendTableViewCell")
        }
    }
    var vm: FriendsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        vm?.updateTableView = { [weak self] in
            self?.tableView.reloadData()
            print(self?.vm?.numberOfRowInSection)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        vm?.updateTableView()
    }
    
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.numberOfRowInSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendTableViewCell", for: indexPath) as? FriendTableViewCell,
              let vm = vm else {
            return UITableViewCell()
        }
        cell.configure(vm: vm.getFriendViewModel(forCellWithIndexPath: indexPath))
        return cell
    }    
}
