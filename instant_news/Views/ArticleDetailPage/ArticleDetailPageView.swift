//
// Created by Patrice GADEGBE on 10/11/2022.
//

import UIKit

class ArticleDetailPageView: UIView {

    lazy var headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        // add radius to header image
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

    lazy var articleContentTextView: UITextView = {
        let text = UITextView()
        text.font = UIFont.systemFont(ofSize: 12)
        text.isScrollEnabled = false
        text.isEditable = false
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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

        addSubview(headerImage)
        addSubview(headerTintView)
        addSubview(infoLabel)
        addSubview(authorLabel)
        addSubview(titleLabel)
        addSubview(shareButton)
        addSubview(descriptionLabel)
        addSubview(descriptionVerticalView)
        addSubview(articleContentTextView)
        addSubview(openOnWeb)

        NSLayoutConstraint.activate([
            // add constraints to headerImage
            headerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImage.topAnchor.constraint(equalTo: topAnchor),
            headerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImage.heightAnchor.constraint(equalTo: headerImage.widthAnchor),

            // add constraints to headerTintView
            headerTintView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTintView.topAnchor.constraint(equalTo: topAnchor),
            headerTintView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerTintView.heightAnchor.constraint(equalTo: headerTintView.widthAnchor),

            // add constraints to shareButton
            shareButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            shareButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),

            // add constraints to infoLabel
            infoLabel.leadingAnchor.constraint(equalTo: headerImage.leadingAnchor, constant: 20),
            infoLabel.bottomAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: -20),

            // add constraints to infoLabel
            authorLabel.trailingAnchor.constraint(equalTo: headerImage.trailingAnchor, constant: -20),
            authorLabel.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor),

            // add constraints to titleLabel
            titleLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -20),

            // add constraints to descriptionLabel
            descriptionVerticalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionVerticalView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 20),
            descriptionVerticalView.widthAnchor.constraint(equalToConstant: 5),
            descriptionVerticalView.heightAnchor.constraint(equalTo: descriptionLabel.heightAnchor),

            // add constraints to descriptionLabel
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionVerticalView.trailingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionVerticalView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // add constraints to contentTextView
            articleContentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            articleContentTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            articleContentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            // add constraints to openOnWeb
            openOnWeb.leadingAnchor.constraint(equalTo: articleContentTextView.leadingAnchor),
            openOnWeb.topAnchor.constraint(equalTo: articleContentTextView.bottomAnchor, constant: 20),
            openOnWeb.trailingAnchor.constraint(equalTo: articleContentTextView.trailingAnchor),
        ])
    }
}
