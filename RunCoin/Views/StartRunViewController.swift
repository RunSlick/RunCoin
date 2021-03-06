//
//  StartRunViewController.swift
//  RunCoin
//
//  Created by Roland Christensen on 3/23/18.
//  Copyright © 2018 Roland Christensen. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class StartRunViewController: UIViewController {
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Successfully logged out of Firebase from home screen!")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        goToHomeScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(signInVC, animated: true, completion: nil)
    }
}
