//

import Foundation
import UIKit

enum ShouldDeselect {
    case no
    case yes
}

typealias SelectionBlock = () -> ShouldDeselect

protocol Item {
    var reuseIdentifier: String { get }
}

protocol TextItem: Item {
    var text: String { get }
    var numberOfLines: Int { get }
}

extension TextItem {
    var numberOfLines: Int {
        return 0
    }

    var reuseIdentifier: String {
        return SimpleTextCell.reuseIdentifier
    }
}

protocol ImageItem: Item {
    var image: UIImage { get }
    var contentMode: UIView.ContentMode { get }
}

extension ImageItem {
    var contentMode: UIView.ContentMode {
        return .scaleAspectFit
    }

    var reuseIdentifier: String {
        return SimpleImageCell.reuseIdentifier
    }
}

protocol SelectableItem: Item {
    var selected: SelectionBlock { get }
}

protocol CustomItem: Item {
    func configure(cell: UITableViewCell)
}

extension SelectableItem {
    var selected: SelectionBlock {
        return { .yes }
    }
}

extension String: TextItem, SelectableItem {
    var text: String {
        return self
    }
}

extension UIImage: ImageItem, SelectableItem {
    var image: UIImage {
        return self
    }
}
