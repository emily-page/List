//
//  ViewController.swift
//  List
//
//  Created by ios6 on 5/3/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks: [List] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        getData()
        myTableView.reloadData()
    }
    
    func getData()
    {
        do
        {
            tasks = try context.fetch(List.fetchRequest())
        }
        catch
        {
            print("Fetching Failed")
        }
    }
    
    @IBAction func barButtonAdd(_ sender: UIBarButtonItem)
    {
        
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let task = tasks[indexPath.row]
        if let myName = task.clothes
        {
            cell.textLabel?.text = myName
        }
        cell.detailTextLabel?.text = tasks[indexPath.row].subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do
            {
                tasks = try context.fetch(List.fetchRequest())
            }
            catch
            {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
}
