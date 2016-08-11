//
//  ViewController.swift
//  Encuestas
//
//  Created by Ivan Tzicuri De la luz Escalante on 11/08/16.
//  Copyright © 2016 Ivan Tzicuri De la luz Escalante. All rights reserved.
//

import UIKit
import WebKit
import Darwin

class ViewController: UIViewController {
    
    
    @IBOutlet weak var webview: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if ReachWS.isConnectedToNetwork() == true {
            
            let url = NSURL(string:"https://secure-mesa-50981.herokuapp.com")
            let req = NSURLRequest(URL:url!)
            self.webview!.loadRequest(req)
        }
        else{
            let alertController = UIAlertController(title: "Sin conexión", message:
                "No se puede cargar la encuesta", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: { (action:UIAlertAction!) in
                exit(0)
            }))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



