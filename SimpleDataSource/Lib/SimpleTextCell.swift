//

import Foundation
import UIKit

class SimpleTextCell: UITableViewCell {

    static let reuseIdentifier = "SimpleTextCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with textItem: TextItem) {
        textLabel?.text = textItem.text
        textLabel?.numberOfLines = textItem.numberOfLines
    }
}
