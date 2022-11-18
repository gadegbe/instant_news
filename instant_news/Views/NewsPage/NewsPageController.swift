//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class NewsPageController: UIViewController, UISearchBarDelegate {

    // the view model
    let articlesViewModel = ArticlesListViewModel<ArticlesRestApi>()
    // the article table datasource
    lazy var dataSource = ArticlesListDataSource(articlesViewModel)
    // the article table delegate
    lazy var delegate = ArticlesListDelegate(navigationController: navigationController, vm: articlesViewModel)
    // the search delegate with debounce
    lazy var searchBarDelegate = NewsPageSearchBarDelegate(vm: articlesViewModel)
    // the content view
    let contentView = NewsPageView();

    override func loadView() {
        view = contentView
        configure()
    }

    private func configure() {
        navigationController?.navigationBar.barStyle = .default
        contentView.sortByModal.vm = articlesViewModel

        // setup the datasource and delegates
        contentView.articlesListView.dataSource = dataSource
        contentView.articlesListView.delegate = delegate
        contentView.searchBar.delegate = searchBarDelegate

        // setup sortby button action
        contentView.sortByButton.addTarget(self, action: #selector(sortByPressed), for: .touchUpInside)

        articlesViewModel.reloadContent = { [self] in
            Task {
                contentView.articlesListView.isHidden = articlesViewModel.articles.isEmpty
                contentView.emptyImage.isHidden = !contentView.articlesListView.isHidden
                if articlesViewModel.query != nil && !articlesViewModel.query!.isEmpty {
                    contentView.sortByButton.isHidden = false
                    contentView.sortByButton.setTitle(articlesViewModel.selectOrder.name, for: .normal)
                } else {
                    contentView.sortByButton.isHidden = true
                }
                contentView.articlesListView.reloadData()
            }
        }
    }

    @objc func sortByPressed(sender: UIButton!) {
        navigationController!.present(contentView.sortByModal, animated: true, completion: nil)
    }
}
