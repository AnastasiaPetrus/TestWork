//
//  FontsListTableViewCell.swift
//  TestWork
//
//  Created by Anastasia on 6/13/19.
//  Copyright © 2019 Anastasia. All rights reserved.
//

import UIKit

class FontsListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

}
