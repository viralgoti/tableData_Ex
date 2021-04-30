//
//  Cell.swift
//  headerCellTest
//
//  Created by Ramesh Patel on 28/04/21.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var countLbl: UILabel!
    
    var plusBtnAction: (()->Void)? = nil
    var minusBtnAction: (()->Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func plusBtnTap(_ sender: UIButton){
        if let plusBtnAction = self.plusBtnAction{
            plusBtnAction()
        }
    }
    
    @IBAction func minusBtnTap(_ sender: UIButton){
        if let minusBtnAction = self.minusBtnAction{
            minusBtnAction()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
