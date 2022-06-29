//
//  MemoTableTableViewController.swift
//  torimamemo
//
//  Created by clark on 2022/05/24.
//

import UIKit

class MemoTableTableViewController: UITableViewController {
    
//    セクション設置は「＃04」

//    var memos = [
//             ["title": "5月18日", "detail": "今日は雨だった"],
//             ["title": "5月19日", "detail": "今日は曇りだった"],
//             ["title": "5月20日", "detail": "今日は晴れだった"]
//         ]
    let userDefaults = UserDefaults.standard
    var memos = [String]() ///*[*/["タピ","オカ","パン"]/*,["月","太陽"]]*/
    var targets = [String]()
    
//    self.userDefaults.set(self.memos, forKey: "memos")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.userDefaults.object(forKey: "memos") != nil {
            self.memos=self.userDefaults.stringArray(forKey: "memos")!
        }else{
            self.memos=[]
        }
        if self.userDefaults.object(forKey: "targets") != nil {
            self.targets=self.userDefaults.stringArray(forKey: "targets")!
        }else{
            self.targets=[]
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "section-\(section)やで〜！"
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)//ここ編集
     
        // Configure the cell...
        cell.textLabel?.text = self.memos[indexPath.row]
//        cell.textLabel?.text = self.memos[indexPath.section][indexPath.row]//ここ追加
        
//        cell.textLabel?.text = self.memos[indexPath.row]["Title"]
//
//        cell.detailTextLabel?.text = self.memos[indexPath.row]["detail"]
        //ここ追加
        
        return cell
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return self.memos.count
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return self.memos[section].count
        return self.memos.count
    }
    
    override func  tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.memos.remove(at: indexPath.row)
            self.targets.remove(at: indexPath.row)
            
            self.userDefaults.set(self.memos, forKey: "memos")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
//            行の挿入
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else{
            return
        }
        if identifier == "editMemo"{
            let memoVC = segue.destination as! MemoViewController
            memoVC.memo = self.memos[(self.tableView.indexPathForSelectedRow?.row)!]
            let targetVC = segue.destination as! MemoViewController
            targetVC.target = self.targets[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    @IBAction func unwindToMemoList(sender:UIStoryboardSegue){
        guard let sourceVC=sender.source as? MemoViewController,
        let memo = sourceVC.memo else{
            return
        }
//        let target = sourceVC.target else{
//            return
//        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
            self.memos[selectedIndexPath.row] = memo
        } else {
        self.memos.append(memo)
        }
        self.userDefaults.set(self.memos, forKey: "memos")
//        self.tableView.reloadData()
        
        guard let sourceVC=sender.source as? MemoViewController,
        let target = sourceVC.target else{
            return
        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
            self.targets[selectedIndexPath.row] = target
        } else {
        self.targets.append(target)
        }
        self.userDefaults.set(self.targets, forKey: "targets")
        
        self.tableView.reloadData()
    }
    
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
