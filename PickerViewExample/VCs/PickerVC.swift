//
//  PickerVC.swift
//  PickerViewExample

import UIKit

protocol PickerVCDelegate {
    func sendDoB(date: Date)
}

class PickerVC: UIViewController {
    
    var delegate: PickerVCDelegate?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: false, completion: {
            print("Picker view dismissed")
        })
    }
    
    @IBAction func didTapOnSet(_ sender: Any) {
        self.dismiss(animated: false, completion: {
            let _date = self.datePicker.date
            print("DoB SENT \(_date)")
            self.delegate?.sendDoB(date: _date)
        })
    }
}
