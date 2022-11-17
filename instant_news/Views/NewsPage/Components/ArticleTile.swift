//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit


class ArticleTile: UITableViewCell {

    lazy var leadingImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        // add radius to leading image
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure(_ article: Article) {

        leadingImage.load(link: article.urlToImage ?? "")
        titleLabel.text = article.title
        subTitleLabel.text = article.description
        infoLabel.text = article.formattedDate()

        contentView.addSubview(leadingImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            // add constraints to the leadingImage
            leadingImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            leadingImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            leadingImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            leadingImage.widthAnchor.constraint(equalTo: leadingImage.heightAnchor),

            // add constraints to the titleLabel
            titleLabel.topAnchor.constraint(equalTo: leadingImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // add constraints to the subTitleLabel
            subTitleLabel.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

            // add constraints on infoLabel
            infoLabel.widthAnchor.constraint(equalTo: subTitleLabel.widthAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: subTitleLabel.leadingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
}