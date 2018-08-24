//
//  ViewControllerResultados.swift
//  CAM
//
//  Created by Arturo on 8/16/18.
//  Copyright © 2018 cam. All rights reserved.
//

import UIKit

class ViewControllerResultados: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let url = URL(string: "https://cam.economia.unam.mx")
            else { return }
        webView.loadRequest( URLRequest(url: url) )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
