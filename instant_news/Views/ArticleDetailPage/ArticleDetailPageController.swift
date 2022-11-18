//
// Created by Patrice GADEGBE on 12/11/2022.
//

import UIKit

class ArticleDetailPageController: UIViewController {

    // the article to show
    var article: Article?
    // the content view
    let contentView = ArticleDetailPageView();

    init(article: Article) {
        super.init(nibName: nil, bundle: nil)
        self.article = article
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func loadView() {
        super.loadView()
        view = contentView
        configure()
    }

    private func configure() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white

        // setup action buttons
        contentView.shareButton.addTarget(self, action: #selector(shareLink), for: .touchUpInside)
        contentView.openOnWeb.addTarget(self, action: #selector(openLink), for: .touchUpInside)

        // load the header image
        contentView.headerImage.load(link: article!.urlToImage ?? "")

        // setup texts
        contentView.infoLabel.text = "\(article?.source.name ?? "") - \(article?.formattedDate() ?? "")"
        contentView.authorLabel.text = article?.author
        contentView.titleLabel.text = article?.title
        contentView.descriptionLabel.text = article?.description
        contentView.articleContentTextView.text = article?.cleanedContent()

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
