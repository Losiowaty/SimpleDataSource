//

import UIKit

struct Custom: CustomItem, SelectableItem {

    var reuseIdentifier: String {
        return "CustomCell"
    }

    func configure(cell: UITableViewCell) {
        (cell as? CustomCell)?.configure()
    }
}
