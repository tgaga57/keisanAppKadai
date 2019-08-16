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
    var previousSelectNumber: Double = 0
    // 計算に行っていいかの判断値
    var checkMath = false
    // 計算結果を入れる箱
    var result: Double = 0
    // 演算子
    var operation: String = ""
    // 入力されたにが数字どうかの真偽値
    var inValue = false
    // ラベルを編集できるかどうか
    var editLabel: Bool = true
    
    // 計算結果を表示するラベル
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // クリアする関数を作ります
    func clear() {
        // クリアする
        label.text = ""
        result = 0
        previousSelectNumber = 0
        numberOnScreen = 0
        operation = ""
        inValue = false
        editLabel = true
        checkMath = false
    }
    
    // ０−９のボタン
    @IBAction func numbers(_ sender: UIButton) {
        // 計算結果の上書き禁止を行います
        if editLabel {
            if checkMath {
                label.text = String(sender.tag)
                numberOnScreen = Double(label.text!)!
                checkMath = false
            } else {
                label.text = label.text! + String(sender.tag)
                numberOnScreen = Double(label.text!)!
            }
        }
        inValue = true
    }
    
    // 割り算　掛け算　足し算　引き算　C ＝ のボタン
    @IBAction func actions(_ sender: UIButton) {
        
        // ラベルを書き換えOK
        editLabel = true
        // c が押された時
        if sender.currentTitle == "C" {
            // クリアする
            clear()
        } else if inValue && sender.currentTitle == "="  {// = が押された時
            // 演算子を判定して、演算を実行
            switch operation {
            case "÷":
                result = previousSelectNumber / numberOnScreen
            case "×":
                result = previousSelectNumber * numberOnScreen
            case "+":
                result = previousSelectNumber + numberOnScreen
            case "-":
                result = previousSelectNumber - numberOnScreen
            default:
                break
            }
            // 小数点で値を分離
            let shosus: [String] = String(result).components(separatedBy: ".")
            
            // 計算結果が無限ではない、かつ整数である時の処理
            if !result.isInfinite && shosus.last == "0" {
                // 小数点以下が0であるなら
                label.text = String(Int(result))
            } else {
                // 小数点以下が0でない = 少数で表示する
                label.text = String(result)
            }
            
            // 数値が入っている
            inValue = true
            // 数値を足せないようにする
            editLabel = false
        } else { // アクションのいずれかが押されたとき
            // 画面に表示されている数字を変数に代入
            if inValue {
                previousSelectNumber = Double(label.text!)!
            }
            // 「 = 」以外の演算子を表示
            if sender.currentTitle != "=" {
                label.text = sender.currentTitle
            }
            // 数値は入っていない
            inValue = false
            // 演算子を記憶
            operation = sender.currentTitle!
            // 計算していい
            checkMath = true
        }
    }
}
