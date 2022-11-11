//
// Created by Patrice GADEGBE on 11/11/2022.
//

import UIKit

class ArticlesListDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
}
