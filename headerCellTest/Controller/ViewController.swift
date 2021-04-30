//
//  ViewController.swift
//  headerCellTest
//
//  Created by Ramesh Patel on 28/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data =  [String:[String: String]]()
    
    var sectionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        
    }
    
    @IBAction func addHeaderBtnTap(_ sender: UIButton){
        let data: [String: [String: String]] = ["\(self.sectionCount + 1)": [:]]
        if self.data.isEmpty{
            self.data = data
        }else{
            self.data.merge(dict: data)
        }
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionCount = self.data.count
        return sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellCount = self.data["\(section + 1)"]?.count ?? 0
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
           
        var data = self.data["\(indexPath.section + 1)"]?["\(indexPath.row + 1)"]
        
        cell.indentationLevel = 16
        cell.titleLbl.text = "Cell \(indexPath.row + 1)"
            
        cell.countLbl.text = "\(data!)"
        cell.plusBtnAction = {
            print(indexPath.row)
            
            var number = Int(data!)!
            
            number += 1
            data = "\(number)"
            
            self.data["\(indexPath.section + 1)"]?["\(indexPath.row + 1)"] = String(number)
            cell.countLbl.text = "\(number)"
        }
        
        cell.minusBtnAction = {
            
            var number = Int(data!)!
            
            number -= 1
            
            if number < 0{
                number = 0
            }
            data = "\(number)"
            
            self.data["\(indexPath.section + 1)"]?["\(indexPath.row + 1)"] = String(number)
            cell.countLbl.text = "\(number)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell: HeaderCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        
            cell.titleLbl.text = "Header \(section + 1)"
        
        cell.plusBtnAction = {
                let cellCount = self.data["\(section + 1)"]?.count ?? 0
                if cellCount == 0{
                    let cellData: [String: String] = ["\(cellCount + 1)": "0"]
                    self.data["\(section + 1)"] = cellData
                }else{
                    let cellData: [String: String] = ["\(cellCount + 1)": "0"]
                    self.data["\(section + 1)"]?.merge(dict: cellData)
                }
            self.tableView.reloadData()
            print(section)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
