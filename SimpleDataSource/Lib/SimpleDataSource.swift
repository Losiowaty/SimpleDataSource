//

import Foundation
import UIKit

class SimpleDataSource: NSObject, UITableViewDataSource, UITableViewDelegate, ExpressibleByArrayLiteral {

    typealias ArrayLiteralElement = Item

    fileprivate var backingStore: [Item] = []

    private var tableView: UITableView? {
        didSet {
            if oldValue == nil {
                registerCells()
            }
        }
    }

    required init(arrayLiteral elements: ArrayLiteralElement...) {
        backingStore = elements
    }

    private func registerCells() {
        tableView?.register(SimpleTextCell.self, forCellReuseIdentifier: SimpleTextCell.reuseIdentifier)
        tableView?.register(SimpleImageCell.self, forCellReuseIdentifier: SimpleImageCell.reuseIdentifier)
    }

    @objc func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tableView = tableView
        return backingStore.count
    }

    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView = tableView
        let item = backingStore[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.reuseIdentifier, for: indexPath)

        configure(cell: cell, with: item)

        return cell
    }

    @objc func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = backingStore[indexPath.row] as? SelectableItem {
            if case ShouldDeselect.yes = item.selected() {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

}

extension SimpleDataSource {
    func configure(cell: UITableViewCell, with item: Item) {
        if let item = item as? TextItem {
            (cell as? SimpleTextCell)?.configure(with: item)
            return
        }
        if let item = item as? ImageItem {
            (cell as? SimpleImageCell)?.configure(with: item)
            return
        }
        if let item = item as? CustomItem {
            item.configure(cell: cell)
        }
    }
}
