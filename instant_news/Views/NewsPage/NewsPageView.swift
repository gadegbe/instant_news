//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class NewsPageView: UIView {

    lazy var sortByModal = SortByModal()

    let articlesListView = {
        let table = UITableView()
        table.register(ArticleTile.self, forCellReuseIdentifier: "ArticleTile")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    let searchBar = {
        let bar = UISearchBar()
        bar.searchBarStyle = UISearchBar.Style.prominent
        bar.placeholder = " Rechercher..."
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
        button.isHidden = true
        return button
    }()

    let newsTitle = {
        let label = UILabel()
        label.text = "Actualités"
        label.font = label.font.withSize(30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let emptyImage = {
        let image = UIImage(named: "server-down")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init() {
        self.init(frame: CGRect.zero)
        configure()
    }

    private func configure() {
        backgroundColor = .systemBackground
        addSubview(newsTitle)
        addSubview(searchBar)
        addSubview(sortByButton)
        addSubview(articlesListView)
        addSubview(emptyImage)

        NSLayoutConstraint.activate([
            // add constraints to the newsTitle
            newsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsTitle.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),

            // add constraints to the sortByButton
            sortByButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            sortByButton.bottomAnchor.constraint(equalTo: newsTitle.bottomAnchor),

            // add constraints to the searchBar
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: newsTitle.bottomAnchor),

            // add constraints to the articlesListView
            articlesListView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            articlesListView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            articlesListView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            articlesListView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // add constraints to the articlesListView
            emptyImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyImage.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            emptyImage.heightAnchor.constraint(equalTo: emptyImage.widthAnchor),
        ])
    }
}
