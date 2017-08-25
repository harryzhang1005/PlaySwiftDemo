//
//  DataSource.swift
//  TrySwiftDemo
//
//  Created by Hongfei Zhang on 8/24/17.
//  Copyright © 2017 Deja View Concepts, Inc. All rights reserved.
//

import UIKit

protocol SourceType: UITableViewDataSource {
	
	var dataObject: DataType {get set}
	var conditionForAdding: Bool {get}
	
	func insertTopRow(tableView: UITableView)
	func deleteRowAtIndexPath(indexPath: IndexPath, from tableView: UITableView)
	func addItemTo(tableView: UITableView)
	
}

extension SourceType {
	
	func insertTopRow(tableView: UITableView) {
		tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
	}
	
	func deleteRowAtIndexPath(indexPath: IndexPath, from tableView: UITableView) {
		tableView.deleteRows(at: [indexPath], with: .fade)
	}
	
	func addItemTo(tableView: UITableView) {
		if conditionForAdding {
			dataObject = dataObject.addNewItemAtIndex(index: 0)
			insertTopRow(tableView: tableView)
		}
	}
	
}

class DataSource: NSObject, UITableViewDataSource, SourceType {
	
	// MARK: - SourceType methods
	
	var dataObject: DataType //= Hand()
	
	// Use generic
	init<T: DataType>(dataObject: T) {
		self.dataObject = dataObject
	}
	
	var conditionForAdding: Bool {
		//return dataObject.numberOfItems < 5	// put this in sub-class
		return false
	}
	
	// MARK: - TableViewDataSource methods
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataObject.numberOfItems
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		/* put this in sub-class
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCardCell, for: indexPath) as? CardCell else {
			fatalError("Could not create CardCell")
		}
		
		cell.fillWith(card: (dataObject as! Hand)[indexPath.row])
		
		return cell
		*/
		fatalError("This method must be overriden")
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			// Delete the row from the data source
			dataObject = dataObject.deleteItemAtIndex(index: indexPath.row)
			deleteRowAtIndexPath(indexPath: indexPath, from: tableView)
		}
		else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
	
	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		// To move a row, we don't have to do the GUI code. Apple does that for us.
		dataObject = dataObject.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
	}
	
}
