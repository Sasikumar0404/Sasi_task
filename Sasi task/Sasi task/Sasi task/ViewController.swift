//
//  ViewController.swift
//  Sasi task
//
//  Created by Shreedharshan on 31/12/21.
//

import UIKit



class registerViewController: UIViewController ,UITextFieldDelegate{
    
    

    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var mobilenotextfield: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var confirmpasswordtextfield: UITextField!
    

    var mybool:Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Angel.jpeg")!)
        
        
        
        
        self.nametextfield.layer.cornerRadius = 25
        self.nametextfield.layer.borderWidth = 1.0
        self.nametextfield.layer.borderColor = UIColor.lightGray.cgColor
        self.nametextfield.delegate = self
        self.nametextfield.returnKeyType = .done;
        self.view.addSubview(nametextfield)
        let paddingview = UIView.init(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        self.nametextfield.leftView = paddingview
        self.nametextfield.leftViewMode = .always
        
        
      
        self.emailtextfield.layer.cornerRadius = 25
        self.emailtextfield.layer.borderWidth = 1.0
        self.emailtextfield.layer.borderColor = UIColor.lightGray.cgColor
        self.emailtextfield.delegate = self
        self.emailtextfield.keyboardType = .emailAddress
        
        self.view.addSubview( emailtextfield)
        let emailpaddingview = UIView.init(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        self.emailtextfield.leftView = emailpaddingview
        self.emailtextfield.leftViewMode = .always
        
        
        self.passwordtextfield.layer.cornerRadius = 25
        self.passwordtextfield.layer.borderWidth = 1.0
        self.passwordtextfield.layer.borderColor = UIColor.lightGray.cgColor
        self.passwordtextfield.delegate = self
        self.view.addSubview(passwordtextfield)
        let passpaddingview = UIView.init(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        self.passwordtextfield.leftView = passpaddingview
        self.passwordtextfield.leftViewMode = .always
        
        
        
        self.confirmpasswordtextfield.layer.cornerRadius = 25
        self.confirmpasswordtextfield.layer.borderWidth = 1.0
        self.confirmpasswordtextfield.layer.borderColor = UIColor.lightGray.cgColor
        self.confirmpasswordtextfield.delegate = self
        self.view.addSubview(confirmpasswordtextfield)
        let passpaddingview1 = UIView.init(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        self.confirmpasswordtextfield.leftView = passpaddingview1
        self.confirmpasswordtextfield.leftViewMode = .always
        
        self.addDoneButtonOnKeyboard()
        
        self.mobilenotextfield.layer.cornerRadius = 25
        self.mobilenotextfield.layer.borderWidth = 1.0
        self.mobilenotextfield.layer.borderColor = UIColor.lightGray.cgColor
        self.mobilenotextfield.delegate = self
        self.mobilenotextfield.keyboardType = .numberPad
        self.mobilenotextfield.returnKeyType = .done
        self.view.addSubview(mobilenotextfield)
        
        self.registerBtn.layer.cornerRadius = 10
       // self.registerBtn.layer.borderWidth = 1.0
      //  self.registerBtn.layer.borderColor = UIColor.lightGray.cgColor
        
        
        let mobilennopaddingview = UIView.init(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        self.mobilenotextfield.leftView = mobilennopaddingview
        self.mobilenotextfield.leftViewMode = .always
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func registerBtnaction(_ sender: Any) {
        if nametextfield.text == ""{
            self.mybool = false
            self.showalertmessage(title: "information", message: "enter your name", presentbool: self.mybool)
        }
        if isValidEmail(emailID: emailtextfield.text!) == false {
                    self.mybool = false
                    self.showalertmessage(title: "information", message: "enter correct email address", presentbool: self.mybool)
                }
         if emailtextfield.text == ""{
            self.mybool = false
            self.showalertmessage(title: "information", message: "enter your email", presentbool: self.mybool)
        }
         if passwordtextfield.text == ""{
            self.mybool = false
            self.showalertmessage(title: "information", message: "enter your password", presentbool: self.mybool)
        }
         if mobilenotextfield.text == ""{
            self.mybool = false
            self.showalertmessage(title: "information", message: "enter your mobileno", presentbool: self.mybool)
        }
        if passwordtextfield.text == confirmpasswordtextfield.text{
            self.mybool = true
            self.showalertmessage(title: "information", message: "successfuly", presentbool: self.mybool)
        }
        else{
            self.mybool = false
            self.showalertmessage(title: "information", message: "Password doesn't match", presentbool: self.mybool)
        }
        // self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.nametextfield{
            self.emailtextfield.becomeFirstResponder()
        }
        else if textField == self.emailtextfield{
            self.passwordtextfield.becomeFirstResponder()
        }
        else if  textField == self.passwordtextfield{
            self.confirmpasswordtextfield.becomeFirstResponder()
        }
        else if textField == self.confirmpasswordtextfield{
            self.mobilenotextfield.becomeFirstResponder()
        }
        else if  textField == self.mobilenotextfield{
            self.mobilenotextfield.resignFirstResponder()
        }
        return true
        
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == mobilenotextfield{
            let maxLength = 10
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        return true
    }
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.adddoneButtonAction))
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.mobilenotextfield.inputAccessoryView = doneToolbar
    }

    @objc func adddoneButtonAction(){
        self.mobilenotextfield.resignFirstResponder()
    }
    
    func showalertmessage(title:String,message:String,presentbool:Bool){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle:.alert)
        let okbutton = UIAlertAction.init(title: "ok", style: .default, handler: { [self](_: UIAlertAction!) in
            if presentbool == true {
                let push = self.storyboard?.instantiateViewController(withIdentifier: "push") as! ApitableTableViewController
                self.navigationController?.pushViewController(push, animated: true)
            }
        })
        
        let cancelbutton = UIAlertAction.init(title: "cancel", style: .default, handler: nil)
        alert.addAction(okbutton)
        alert.addAction(cancelbutton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
      }

}

