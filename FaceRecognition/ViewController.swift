//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Kaushal Topinkatti B on 16/05/21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInBtn(_ sender: Any) {
        
        let authContext = LAContext()
        var error: NSError?
        
        //This will tell us whether iPhone is cable of running faceID or touchID
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                
                if success {
                    //auth success
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
            
                } else {
                    //auth unsuccess
                    DispatchQueue.main.async {
                        self.myLable.text = "ERROR..!!"
                    }
                    
                }
            }
        }
        
    }
    

}

