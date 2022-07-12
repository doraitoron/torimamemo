//
//  MemoViewController.swift
//  torimamemo
//
//  Created by clark on 2022/05/31.
//

import UIKit

class MemoViewController: UIViewController {

    var memo: String?
    var target: String?
    var goal:String?
    var way:String?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var MemoTextField: UITextField!
    
    @IBOutlet weak var TargetTextField:UITextField!
//   /*@State*/ var editText = ""
//    TextEditor(text: $editText)
    
    @IBOutlet weak var GoalTextField:UITextField!
    
    @IBOutlet weak var WayTextField:UITextField!
    
    @IBOutlet var ManButton:UIButton!
    @IBOutlet var womanButton:UIButton!
    @IBOutlet var Y1Button:UIButton!
    @IBOutlet var Y2Button:UIButton!
    @IBOutlet var Y3Button:UIButton!
    @IBOutlet var Y4Button:UIButton!
    @IBOutlet var Y5Button:UIButton!
    
    var switch_man:Bool=false
    var switch_woman:Bool=false
    var switch_Y1:Bool=false
    var switch_Y2:Bool=false
    var switch_Y3:Bool=false
    var switch_Y4:Bool=false
    var switch_Y5:Bool=false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = false
        
        if let memo = self.memo {
            self.MemoTextField.text=memo
            self.TargetTextField.text=target
            self.GoalTextField.text=goal
            self.WayTextField.text=way
            
//            TextEditor(text: $editText)
            
            self.navigationItem.title="Edit Memo"
            self.saveButton.isEnabled = true
        }
        
//        if let target = self.target{
//            self.TargetTextField.text=target
//        }
//        self.memo = self.MemoTextField.text ?? ""
        
        
        MemoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    @objc func textFieldDidChange(sender: UITextField){
        let memo = self.MemoTextField.text ?? ""
        self.saveButton.isEnabled = !memo.isEmpty
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === self.saveButton else {
            return
        }
        self.memo = self.MemoTextField.text ?? ""
        self.target = self.TargetTextField.text ?? ""
        self.goal = self.GoalTextField.text ?? ""
        self.way = self.WayTextField.text ?? ""
    }
    
//    var memos = ["タピ","オカ","パン"]

//    キャンセルボタン

    @IBAction func cancel(_ sender: Any) {
        if self.presentingViewController is UINavigationController {
        self.dismiss(animated:true,completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
                }
        }
    
    @IBAction func touchButton_man(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_man ) {
         print("false")
         switch_man = false
           ManButton.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_man = true
           ManButton.backgroundColor = UIColor.darkText
       }
     }
    
    @IBAction func touchButton_woman(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_woman ) {
         print("false")
         switch_woman = false
           womanButton.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_woman = true
           womanButton.backgroundColor = UIColor.darkText
       }
     }
    
    @IBAction func touchButton_Y1(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_Y1 ) {
         print("false")
         switch_Y1 = false
           Y1Button.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_Y1 = true
           Y1Button.backgroundColor = UIColor.darkText
       }
     }
    @IBAction func touchButton_Y2(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_Y2 ) {
         print("false")
         switch_Y2 = false
           Y2Button.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_Y2 = true
           Y2Button.backgroundColor = UIColor.darkText
       }
     }
    @IBAction func touchButton_Y3(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_Y3 ) {
         print("false")
         switch_Y3 = false
           Y3Button.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_Y3 = true
           Y3Button.backgroundColor = UIColor.darkText
       }
     }
    @IBAction func touchButton_Y4(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_Y4 ) {
         print("false")
         switch_Y4 = false
           Y4Button.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_Y4 = true
           Y4Button.backgroundColor = UIColor.darkText
       }
     }
    @IBAction func touchButton_Y5(_ sender: Any) {
       print("ボタンが押されました")
       if ( switch_Y5 ) {
         print("false")
         switch_Y5 = false
           Y5Button.backgroundColor = UIColor(red:1,green: 193/255,blue: 1,alpha: 1)
       }
       else {
         print("true")
         switch_Y5 = true
           Y5Button.backgroundColor = UIColor.darkText
       }
     }
    
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


