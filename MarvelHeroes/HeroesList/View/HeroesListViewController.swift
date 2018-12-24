//
//  HeroesListViewController.swift
//  MarvelHeroes
//
//  Created by Aleix on 21/12/2018.
//  Copyright © 2018 Aleix Cos. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {
    var presenter: HeroesListPresenterProtocol?
    var heroesList = [Heroe]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.register(UINib.init(nibName: String(describing: HeroesListTableViewCell.self), bundle: nil), forCellReuseIdentifier: HeroesListTableViewCell.identifier)
    }
}

extension HeroesListViewController: HeroesListViewProtocol{
    func showHeroes(_ heroes: [Heroe]) {
        heroesList = heroes
        tableView.reloadData()
    }
}

extension HeroesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let heroe = heroesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HeroesListTableViewCell.identifier, for: indexPath) as! HeroesListTableViewCell
        cell.configureWithHeroe(heroe)
        return cell
    }
}
