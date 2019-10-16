//
//  secondViewController.swift
//  List
//
//  Created by ios6 on 5/3/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import UIKit

class secondViewController: UIViewController
{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var deadLinePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func addTask(_ sender: UIButton)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = List(context: context)
        task.clothes = textField.text!
        task.subtitle = deadLinePicker.date.description
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker)
    {
        let dateForm = DateFormatter()
        //deadLinePicker.timeZone = TimeZone.current
        //deadLinePicker.viewPrintFormatter("YYYY-MM-dd HH:mm")
        //deadLinePicker.locale = "YYYY-MM-dd HH:mm"
        //dateForm.dateFormat(fromTemplate: "MM-DD-YYYY HH:mm", options: 0, locale: .current)
        dateForm.dateFormat = "MM-DD-YYYY HH:mm"
       // dateForm.dateStyle = CFDateFormatterStyle.fullStyle
        print(dateForm)
    }
}
