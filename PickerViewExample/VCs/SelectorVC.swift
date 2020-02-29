//
//  SelectorVC.swift
//  TestModelPresentation

import UIKit

class SelectorVC: UIViewController {

    @IBOutlet weak var dobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showAsModal() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PickerVC") as! PickerVC
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func didTapOnGender(_ sender: Any) {
        showAsModal()
    }
    
}

extension SelectorVC: PickerVCDelegate {
    
    func sendDoB(date: Date) {
        print("DoB RECEIVED \(date)")
        let _dateString = date.convertDateToString("dd MMMM yyyy")
        dobLabel.text = _dateString
    }
}

extension Date {
    
    // Convert Date to String
    func convertDateToString(_ formatString: String) -> String {
        let formatter = DateFormatter() // Create Date Formatter
        formatter.dateFormat = formatString // Specify Format of String to Parse
        let stringFromDate:String = formatter.string(from: self) as String  // Parse into String
        return stringFromDate // Return Parsed String
    }
}

