//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class NewsPageController: UIViewController {
    let articlesListView = UITableView()
    let vm = ArticlesListViewModel()
    lazy var dataSource = {
        ArticlesListDataSource(vm)
    }()

    lazy var delegate = {
        ArticlesListDelegate()
    }()

    override func loadView() {
        title = "News"
        view = UIView(frame: .zero)
        articlesListView.register(ArticleTile.self, forCellReuseIdentifier: "ArticleTile")

        vm.reloadContent = { [self] in
            Task {
                await refreshContent()
            }
        }
        articlesListView.dataSource = dataSource
        articlesListView.delegate = delegate
        articlesListView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(articlesListView)
        NSLayoutConstraint.activate([
            articlesListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articlesListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articlesListView.topAnchor.constraint(equalTo: view.topAnchor),
            articlesListView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    private func refreshContent() async {
        DispatchQueue.main.async { [weak self] in
            self?.articlesListView.reloadData()
        }
    }
}