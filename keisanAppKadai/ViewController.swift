//
//  ViewController.swift
//  keisanAppKadai
//
//  Created by 志賀大河 on 2019/08/13.
//  Copyright © 2019 Taigashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 画面に表示される数字
    var numberOnScreen: Double = 0
    // 最初に入力した数字
    var  previousSelectNumber: Double = 0
    // 計算に行っていいかの判断値
    var checkMath = false
    // 演算子
     var oparetion = 0
    
    // 計算結果を表示する
    @IBOutlet weak var label: UILabel!
    
    // 数字ボタンの使用を可能に
    @IBAction func numbers(_ sender: UIButton) {
        
        if checkMath == true {
        // タグ番号がゼロからのため数字を合わせる
        label.text = String(sender.tag - 1)
        // 画面に表示される数字が上書きされる
        numberOnScreen = Double(label.text!)!
        checkMath = false
          
        } else {
            // String(sender.tag-1) 数字が代入
            label.text = label.text! + String(sender.tag-1)
            // 数字が表示
            numberOnScreen = Double(label.text!)!
        }
    
    }
    
    
    // 数字が表示されていた場合の処理
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{   //数字が表示されていた場合の処理
            previousSelectNumber = Double(label.text!)!
            if sender.tag == 12{ // ÷
                label.text = "÷";
            }
            else if sender.tag == 13{  // ×
                label.text = "×";
            }
            else if sender.tag == 14{  // -
                label.text = "-";
            }
            else if sender.tag == 15{  // +
                label.text = "+";
            }
            oparetion = sender.tag
            checkMath = true;
        }
        // = が押された時の処理
        else if sender.tag == 16 
        {
            if oparetion == 12{
                label.text = String(previousSelectNumber / numberOnScreen)
            }
            else if oparetion == 13{
                label.text = String(previousSelectNumber * numberOnScreen)
            }
            else if oparetion == 14{
                label.text = String(previousSelectNumber - numberOnScreen)
            }
            else if oparetion == 15{
                label.text = String(previousSelectNumber + numberOnScreen)
            }
        }
            // C が押された時の処理
        else if sender.tag == 11{
            label.text = ""
            previousSelectNumber = 0;
            numberOnScreen = 0;
            oparetion = 0;
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}

