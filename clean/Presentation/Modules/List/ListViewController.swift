//
//  HomeController.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import UIKit

final class ListViewController: BaseViewController {
    var viewModel: ListViewModelProtocol!

    // MARK: - IBOutlets
    lazy var searchBar: UISearchBar = UISearchBar()
    @IBOutlet weak var tableView: UITableView!

    // MARK: - IBActions

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupSearch()
        configure()
        viewModel.viewDidLoad()
    }

    // MARK: - Functions
    func setupBinding() {
        viewModel.listCharactersUpdated = { 	
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.errorHasOcurred = { error in
            print(error)
        }
    }

    func setupSearch() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Buscar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

    func configure(){
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        self.tableView.register(UINib(nibName: "RickAndMortyCharacterCell", bundle: nil), forCellReuseIdentifier: "RickAndMortyCharacterCell")
        self.tableView.register(UINib(nibName: "DisneyCell", bundle: nil), forCellReuseIdentifier: "DisneyCell")
        self.tableView.register(UINib(nibName: "MarvelCell", bundle: nil), forCellReuseIdentifier: "MarvelCell")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.loadMoreCharacter(currentItem: indexPath.row)
        let character = self.viewModel.characters[indexPath.row]        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RickAndMortyCharacterCell", for: indexPath) as! RickAndMortyCharacterCell
        cell.character = character
        return cell
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(this: searchText)
    }
}
