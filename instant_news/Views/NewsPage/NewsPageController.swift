//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class NewsPageController: UIViewController, UISearchBarDelegate {

    let articlesViewModel = {
        ArticlesListViewModel()
    }()

    lazy var dataSource = {
        ArticlesListDataSource(articlesViewModel)
    }()

    lazy var delegate = {
        ArticlesListDelegate(navigationController: navigationController, vm: articlesViewModel)
    }()

    lazy var sortByModal = {
        SortByModal()
    }()

    let articlesListView = {
        let table = UITableView()
        table.register(ArticleTile.self, forCellReuseIdentifier: "ArticleTile")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    let searchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = UISearchBar.Style.prominent
        bar.placeholder = " Search..."
        bar.sizeToFit()
        bar.isTranslucent = false
        bar.backgroundImage = UIImage()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()

    let sortByButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "chevron.down")
        button.setTitle("Trier", for: .normal)
        button.semanticContentAttribute = UIApplication.shared
                .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let newsTitle = {
        let label = UILabel()
        label.text = "Actualités"
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func loadView() {
        view = UIView(frame: .zero)
        initialize()
        configure()
    }

    private func configure() {
        navigationController?.navigationBar.barStyle = .default
        
        view.backgroundColor = .systemBackground
        view.addSubview(newsTitle)
        view.addSubview(sortByButton)
        view.addSubview(searchBar)
        view.addSubview(articlesListView)

        NSLayoutConstraint.activate([
            // add constraints to the newsTitle
            newsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newsTitle.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),

            // add constraints to the sortByButton
            sortByButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sortByButton.bottomAnchor.constraint(equalTo: newsTitle.bottomAnchor),

            // add constraints to the searchBar
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: newsTitle.bottomAnchor),

            // add constraints to the articlesListView
            articlesListView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            articlesListView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            articlesListView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            articlesListView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func initialize() {
        articlesListView.dataSource = dataSource
        articlesListView.delegate = delegate

        searchBar.delegate = self

        articlesViewModel.reloadContent = { [self] in
            Task {
                articlesListView.reloadData()
            }
        }

        sortByButton.addTarget(self, action: #selector(sortByPressed), for: .touchUpInside)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        //your code here....
    }

    @objc func sortByPressed(sender: UIButton!) {
        navigationController!.present(sortByModal, animated: true, completion: nil)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .default
    }

}