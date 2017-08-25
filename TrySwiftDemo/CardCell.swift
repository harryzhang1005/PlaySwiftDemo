//
//  CardCell.swift
//  TrySwiftDemo
//
//  Created by Hongfei Zhang on 8/24/17.
//  Copyright © 2017 Deja View Concepts, Inc. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

	var suitLabel: UILabel! = UILabel(frame: CGRect(x: 8, y: 8, width: 28, height: 28))
	var rankLabel: UILabel! = UILabel(frame: CGRect(x: 36, y: 8, width: 28, height: 28))

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCell()
	}
	
	func setupCell() {
		self.contentView.addSubview(suitLabel)
		self.contentView.addSubview(rankLabel)
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func fillWith(card: Card) {
		suitLabel.text = card.suit.description
		rankLabel.text = card.rank.description
		rankLabel.textColor = card.color
		rankLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
	}

}
