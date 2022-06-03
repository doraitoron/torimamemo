//
//  MemoViewController.swift
//  torimamemo
//
//  Created by clark on 2022/05/31.
//

import UIKit

class MemoViewController: UIViewController {

    var memo: String?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var MemoTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
