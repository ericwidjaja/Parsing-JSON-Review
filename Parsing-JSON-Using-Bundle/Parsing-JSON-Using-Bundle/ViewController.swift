//
//  ViewController.swift
//  Parsing-JSON-Using-Bundle
//
//  Created by Eric Widjaja on 8/3/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main // table view has only one section
    }

    
    @IBOutlet weak var presidentsTableView: UITableView!
    
    //both the SectionItemIdentifier and the ItemIdentifier need to conform to the Hasable Protocol
    
    typealias DataSource = UITableViewDiffableDataSource<Section, President> //to make it conform to Hashable, add 'Hashable' after 'Decodable' in the President.Swift Model
    private var dataSource: DataSource! //currently has nil value
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        configureDataSource()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // https://www.youtube.com/watch?v=xkcl44jGRvQ at 1:01:26
    private func configureDataSource() {                // similar to indexPath at RowAt
    
        dataSource = DataSource(tableView: presidentsTableView, cellProvider: { (presidentsTableView, indexPath, president) -> UITableViewCell? in
            // configure cell
            let cell = presidentsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = president.name
            cell.detailTextLabel?.text = president.number.description
            // or we can use string interpolation
//            cell.detailTextLabel?.text = "\(president.number)"
            return cell
        })
    }


}

