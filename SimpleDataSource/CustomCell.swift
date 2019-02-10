//

import Foundation
import UIKit

final class CustomCell: UITableViewCell {

    static let reuseIdentifier = "CustomCell"

    func configure() {
        textLabel?.text = "Custom!"
        textLabel?.textColor = .red
        textLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(arc4random_uniform(20) + 20))
    }
}
