//

import Foundation
import UIKit

final class SimpleImageCell: UITableViewCell {
    static let reuseIdentifier = "SimpleImageCell"

    internal var simpleImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupImageView() {
        simpleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(simpleImageView)

        NSLayoutConstraint.activate([
            simpleImageView.heightAnchor.constraint(equalTo: simpleImageView.widthAnchor),

            simpleImageView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: simpleImageView.bottomAnchor, multiplier: 1),

            simpleImageView.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: simpleImageView.trailingAnchor, multiplier: 1),

            simpleImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }

    func configure(with imageItem: ImageItem) {
        simpleImageView.image = imageItem.image
        simpleImageView.contentMode = imageItem.contentMode
    }
}
