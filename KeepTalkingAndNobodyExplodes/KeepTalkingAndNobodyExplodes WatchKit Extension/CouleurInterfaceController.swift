//
//  CouleurInterfaceController.swift
//  KeepTalkingAndNobodyExplodes WatchKit Extension
//
//  Created by David Fournier on 06/01/2018.
//  Copyright © 2018 Salomé Russier. All rights reserved.
//

import WatchKit
import Foundation


class CouleurInterfaceController: WKInterfaceController {

    @IBOutlet var voyant: WKInterfaceGroup!
    @IBOutlet var btn1: WKInterfaceButton!
    @IBOutlet var btn2: WKInterfaceButton!
    @IBOutlet var btn3: WKInterfaceButton!
    @IBOutlet var btn4: WKInterfaceButton!
    
    var num = VarGlobals.number
    var essaie = VarGlobals.shared.nbrEssaie

    var colorClick: [Int] = []
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        

        if num == 1 {
            btn1.setBackgroundColor(UIColor.red)
            btn2.setBackgroundColor(UIColor.blue)
            btn3.setBackgroundColor(UIColor.yellow)
            btn4.setBackgroundColor(UIColor.green)

        }else if num == 2{
            btn1.setBackgroundColor(UIColor.blue)
            btn2.setBackgroundColor(UIColor.red)
            btn3.setBackgroundColor(UIColor.green)
            btn4.setBackgroundColor(UIColor.yellow)
        }else{
            btn1.setBackgroundColor(UIColor.yellow)
            btn2.setBackgroundColor(UIColor.green)
            btn3.setBackgroundColor(UIColor.red)
            btn4.setBackgroundColor(UIColor.blue)
        }
    
    
    
    }
    func upReussi(){
        VarGlobals.shared.updateNbrReussi()
            voyant.setBackgroundColor(UIColor.green)
            btn1.setEnabled(false)
            btn2.setEnabled(false)
            btn3.setEnabled(false)
            btn4.setEnabled(false)

        
        
        if VarGlobals.shared.nbrReussie == 3 {
            //envoie iphone reussi

            let h0 = { }
            
            let action = WKAlertAction(title: "Ok", style: .default, handler:h0)
            
            
            presentAlert(withTitle: "Bravo, bombe désamorcer", message: "", preferredStyle: .actionSheet, actions: [action])
        }
    }
    
    func verifyTab(){
        
        if num == 1 {
            if colorClick[0] == 2 {
                if colorClick[1] == 4 {
                    if colorClick[2] == 3 {
                        if colorClick[3] == 1 {
                            upReussi()
                            return
                        }
                    }
                }
            }
            
        }else if num == 2{
            if colorClick[0] == 3 {
                if colorClick[1] == 1 {
                    if colorClick[2] == 4 {
                        if colorClick[3] == 2 {
                            upReussi()
                            return
                        }
                    }
                }
            }
        }else{
            if colorClick[0] == 1 {
                if colorClick[1] == 3 {
                    if colorClick[2] == 2 {
                        if colorClick[3] == 4 {
                            upReussi()
                            return
                        }
                    }
                }
            }
        }
        colorClick.removeAll()
        
        let h0 = { print("ok")}
        
        let action = WKAlertAction(title: "Approve", style: .default, handler:h0)
        
        VarGlobals.shared.updateNbrEssaie() //prévenir iphone
        
        if(VarGlobals.shared.nbrEssaie == 3){
            presentAlert(withTitle: "Perdu", message: "", preferredStyle: .actionSheet, actions: [action])
            //prévenir iphone
        }else{
            presentAlert(withTitle: "Erreur", message: "", preferredStyle: .actionSheet, actions: [action])

        }
        //envoie iphone erreur
    }
    
    @IBAction func ClickBtn1() {
        
        if colorClick.count < 4 {
            colorClick.append(1)
        }
        if colorClick.count == 4 {
            verifyTab()
        }
    }
    
    @IBAction func ClickBtn2() {
        if colorClick.count < 4 {
            colorClick.append(2)
        }
        if colorClick.count == 4 {
            verifyTab()
        }
    }
    
    @IBAction func ClickBtn3() {
        if colorClick.count < 4 {
            colorClick.append(3)
        }
        if colorClick.count == 4 {
            verifyTab()
        }
    }
    
    @IBAction func ClickBtn4() {
        if colorClick.count < 4 {
            colorClick.append(4)
        }
        if colorClick.count == 4 {
            verifyTab()
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
