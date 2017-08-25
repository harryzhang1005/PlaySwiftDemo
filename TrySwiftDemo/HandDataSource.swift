//
//  HandDataSource.swift
//  TrySwiftDemo
//
//  Created by Hongfei Zhang on 8/24/17.
//  Copyright © 2017 Deja View Concepts, Inc. All rights reserved.
//

import UIKit

class HandDataSource: DataSource {

	init() {
		super.init(dataObject: Hand())
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCardCell, for: indexPath) as? CardCell,
			  let hand = dataObject as? Hand else {
			return UITableViewCell()
		}
		
		cell.fillWith(card: hand[indexPath.row])
		
		return cell
	}
	
	// At most 5 cards in your hand
	override var conditionForAdding: Bool {
		return dataObject.numberOfItems < 5
	}
	
}
