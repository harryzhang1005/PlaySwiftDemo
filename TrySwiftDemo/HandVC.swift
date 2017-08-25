//
//  HandVC.swift
//  TrySwiftDemo
//
//  Created by Hongfei Zhang on 8/24/17.
//  Copyright © 2017 Deja View Concepts, Inc. All rights reserved.
//

import UIKit

class HandVC: UITableViewController {
	
	private var dataSource = HandDataSource()	// Our Model

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,
		                                                         action: #selector(HandVC.addNewCard(sender:)))
		
		self.title = "Cards"
		
		// Bind our Model and View
		self.tableView.dataSource = dataSource
		self.tableView.register(CardCell.self, forCellReuseIdentifier: Constants.kCardCell)
    }
	
	// pass the message to our data source
	@IBAction private func addNewCard(sender: UIBarButtonItem) {
		dataSource.addItemTo(tableView: self.tableView)
	}
		
}
