//
// Created by Patrice GADEGBE on 12/11/2022.
//

import UIKit

class ArticleDetailPageController: UIViewController {

    var article: Article?

    lazy var headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        // add radius to leading image
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        image.backgroundColor = .black.withAlphaComponent(0.5)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let headerTintView = {
        let tint = UIView()
        tint.clipsToBounds = true
        tint.layer.masksToBounds = true
        tint.layer.cornerRadius = 8
        tint.backgroundColor = UIColor(white: 0, alpha: 0.5)
        tint.translatesAutoresizingMaskIntoConstraints = false
        return tint
    }()

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let shareButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "square.and.arrow.up")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let openOnWeb = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "globe")
        button.setTitle(" Lire la suite dans le navigateur", for: .normal)
        button.setImage(image, for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let descriptionVerticalView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 2
        view.backgroundColor = UIColor(red: 0 / 255, green: 30 / 255, blue: 106 / 255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var descriptionLabel: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 12)
        text.isScrollEnabled = false
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    lazy var contentTextView: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 12)
        text.isScrollEnabled = false
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    init(article: Article) {
        super.init(nibName: nil, bundle: nil)
        self.article = article
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        super.loadView()
        view = UIView(frame: .zero)

        configure()
    }

    private func configure() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white

        view.backgroundColor = .systemBackground

        headerImage.load(link: article!.urlToImage ?? "")

        infoLabel.text = "\(article?.source.name ?? "") - \(article?.formattedDate() ?? "")"

        authorLabel.text = article?.author

        titleLabel.text = article?.title

        descriptionLabel.text = article?.description

        contentTextView.text = article?.cleanedContent()

        shareButton.addTarget(self, action: #selector(shareLink), for: .touchUpInside)

        openOnWeb.addTarget(self, action: #selector(openLink), for: .touchUpInside)

        view.addSubview(headerImage)
        view.addSubview(headerTintView)
        view.addSubview(infoLabel)
        view.addSubview(authorLabel)
        view.addSubview(titleLabel)
        view.addSubview(shareButton)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionVerticalView)
        view.addSubview(contentTextView)
        view.addSubview(openOnWeb)

        NSLayoutConstraint.activate([
            // add constraints to headerImage
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.topAnchor.constraint(equalTo: view.topAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.heightAnchor.constraint(equalTo: headerImage.widthAnchor),

            // add constraints to headerTintView
            headerTintView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerTintView.topAnchor.constraint(equalTo: view.topAnchor),
            headerTintView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerTintView.heightAnchor.constraint(equalTo: headerTintView.widthAnchor),

            // add constraints to shareButton
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shareButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),

            // add constraints to infoLabel
            infoLabel.leadingAnchor.constraint(equalTo: headerImage.leadingAnchor, constant: 20),
            infoLabel.bottomAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: -20),

            // add constraints to infoLabel
            authorLabel.trailingAnchor.constraint(equalTo: headerImage.trailingAnchor, constant: -20),
            authorLabel.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor),

            // add constraints to titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -20),

            // add constraints to descriptionLabel
            descriptionVerticalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionVerticalView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 20),
            descriptionVerticalView.widthAnchor.constraint(equalToConstant: 5),
            descriptionVerticalView.heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor),

            // add constraints to descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionVerticalView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionVerticalView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // add constraints to contentTextView
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            contentTextView.heightAnchor.constraint(equalToConstant: 300),

            // add constraints to openOnWeb
            openOnWeb.leadingAnchor.constraint(equalTo: contentTextView.leadingAnchor),
            openOnWeb.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 20),
            openOnWeb.trailingAnchor.constraint(equalTo: contentTextView.trailingAnchor),
        ])
    }

    @objc func openLink(sender: UIButton!) {
        if let url = URL(string: article?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }

    @objc func shareLink(sender: UIButton!) {
        Task {
            let firstActivityItem = article?.title ?? ""
            let secondActivityItem: NSURL = NSURL(string: article?.url ?? "")!

            let activityViewController: UIActivityViewController = UIActivityViewController(
                    activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)

            activityViewController.activityItemsConfiguration = [
                UIActivity.ActivityType.message
            ] as? UIActivityItemsConfigurationReading

            activityViewController.excludedActivityTypes = [
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
            ]

            activityViewController.isModalInPresentation = true
            present(activityViewController, animated: true, completion: nil)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
