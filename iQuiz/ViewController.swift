//
//  ViewController.swift
//  iQuiz
//
//  Created by Jessie Kuo on 06/11/2017.
//  Copyright © 2017 appcat. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var themes = ["Mathematics", "Marvel Super Heroes", "Science"]
    var descriptions = ["Learn more about Mathematics", "Learn more about Heroes", "Learn more about Science"]
    var images = ["40-math", "40-marvel", "40-science"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellView", for: indexPath) as! TableCellView
        cell.title.text = self.themes[indexPath.row]
        cell.desc.text = self.descriptions[indexPath.row]
        cell.imageView?.image = UIImage(named: self.images[indexPath.row])
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.themes.count
    }
    
    @IBAction func settingPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel) {
            action in
        }
        alert.addAction(cancelAlert)
        
        let ok = UIAlertAction(title: "OK", style: .default) {
            action in
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    
    
}

