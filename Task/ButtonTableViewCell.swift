//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Eva Marie Bresciano on 5/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    
    // MARK: - Outlets
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var primaryLabel: UILabel!
    
    var delegate: ButtonTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Actions

    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
             delegate.buttonCellButtonTapped(self)
            
        }
    }
}

    protocol ButtonTableViewCellDelegate {
        func buttonCellButtonTapped(sender: ButtonTableViewCell)
        }

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        
        primaryLabel.text = task.name
        buttonTapped(task.isComplete.boolValue)
    }

}
