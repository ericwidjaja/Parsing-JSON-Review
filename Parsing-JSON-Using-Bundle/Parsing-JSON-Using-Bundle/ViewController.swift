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
    private var dataSource: DataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

