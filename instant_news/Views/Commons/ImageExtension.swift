//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

extension UIImageView {
    func load(link: String) {
        guard let url = URL(string: link) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}