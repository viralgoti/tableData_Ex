//
//  HeaderCell.swift
//  headerCellTest
//
//  Created by Ramesh Patel on 28/04/21.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    var plusBtnAction: (()->Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func plusBtnTap(_ sender: UIButton){
        if let plusBtnAction = self.plusBtnAction{
            plusBtnAction()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
