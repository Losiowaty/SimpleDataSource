//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let simpleDataSource: SimpleDataSource = [
        "Minions ipsum voluptate commodo uuuhhh tempor ut exercitation voluptate ex ullamco aliqua. Aliqua ex eiusmod baboiii pepete hahaha poopayee tulaliloo reprehenderit sed labore. Wiiiii hana dul sae occaecat ti aamoo! Tank yuuu! Velit tulaliloo veniam dolore potatoooo jiji. Jeje underweaaar bee do bee do bee do aliqua veniam para tú ullamco. Tank yuuu! sit amet sed voluptate. Underweaaar quis poulet tikka masala hana dul sae. Ut consequat consectetur incididunt. Wiiiii jeje aliquip para tú elit occaecat pepete. Adipisicing aute esse bappleees voluptate esse pepete.",
        "Minions ipsum tatata bala tu tulaliloo la bodaaa tank yuuu! Gelatooo tatata bala tu hahaha gelatooo uuuhhh poulet tikka masala.",
        UIImage(named: "small")!,
        UIImage(named: "big")!,
        Custom(),
        Custom()]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)

        tableView.dataSource = simpleDataSource
        tableView.delegate = simpleDataSource

    }


}

