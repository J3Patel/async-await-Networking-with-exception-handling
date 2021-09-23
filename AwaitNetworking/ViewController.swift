//
//  ViewController.swift
//  AwaitNetworking
//
//  Created by Jatin on 21/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        abc()
    }

    func abc() {
        Task {
            await call()
        }

    }
}

