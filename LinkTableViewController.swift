//
//  LinkTableViewController.swift
//  Shooter
//
//  Created by Spritle Mac on 26/07/17.
//  Copyright © 2017 Spritle Mac. All rights reserved.
//

import UIKit

class LinkTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var links = [Link]()
    
    //MARK: Private Methods
    
    private func loadSampleLinks() {
        
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let link1 = Link(name: "LINK-1", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let link2 = Link(name: "LINK-2", photo: photo2, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let link3 = Link(name: "LINK-3", photo: photo3, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        links += [link1, link2, link3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(LinkTableViewCell.self, forCellReuseIdentifier: "LinkTableViewCell")

        // Load the sample data.
        loadSampleLinks()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LinkTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LinkTableViewCell  else {
            fatalError("The dequeued cell is not an instance of LinkTableViewCell.")
        }
        // Configure the cell...
        let link = links[indexPath.row]
        
        //cell.nameLabel.text = "klk"
        cell.photoImageView.image = link.photo
        cell.ratingControl.rating = link.rating

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
