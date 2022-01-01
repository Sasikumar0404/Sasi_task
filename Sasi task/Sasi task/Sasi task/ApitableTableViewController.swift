//
//  ApitableTableViewController.swift
//  Sasi task
//
//
//

import UIKit

class ApitableTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var jsondict1: [String:Any] = [String:Any]()
    var jsondict2: [String:Any] = [String:Any]()
    var data: [[String:Any]] = [[String:Any]]()
    var data2: [[String:Any]] = [[String:Any]]()
    
    
    @IBOutlet weak var apitableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.getmethodapi()
        self.getmethodapi2()

    }
    func getmethodapi(){
        let urlstring = "https://reqres.in/api/users?page=1"
        let url = URL(string:urlstring)
        var urlequest = URLRequest(url: url!)
        urlequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlequest){ (data,response,error) in
            
            if let myerror = error{
                print(myerror)
            }
            if let myresponse = response{
                print(myresponse)
            }
            do{
                self.jsondict1 = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                self.data = self.jsondict1["data"] as! [[String : Any]]
                DispatchQueue.main.async {
                    self.apitableview.reloadData()
                }
            }
                catch let error as NSError{
             print(error)
                }
            }
        task.resume()
        }

    func getmethodapi2(){
        let urlstring = "https://reqres.in/api/users?page=2"
        let url = URL(string:urlstring)
        var urlequest = URLRequest(url: url!)
        urlequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlequest){ (data,response,error) in
            
            if let myerror = error{
                print(myerror)
            }
            if let myresponse = response{
                print(myresponse)
            }
            do{
                self.jsondict2 = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                self.data2 = self.jsondict1["data"] as! [[String : Any]]
                DispatchQueue.main.async {
                    self.apitableview.reloadData()
                }
            }
                catch let error as NSError{
             print(error)
                }
            }
        task.resume()
        }
   
  func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

     return data.count
     
 }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ApiTableViewCell
    cell.Firstnamelbl.text = self.data[indexPath.row]["first_name"] as? String
    cell.lastnamelbl.text = self.data[indexPath.row]["last_name"] as? String
    cell.emaillbl.text = self.data[indexPath.row]["email"] as? String
  //  let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! ApiTableViewCell
//    cell.Firstnamelbl.text = self.data2[indexPath.row]["first_name"] as? String
//    cell.lastnamelbl.text = self.data2[indexPath.row]["last_name"] as? String
//    cell.emaillbl.text = self.data2[indexPath.row]["email"] as? String
    
    
    let imageurl = URL(string: "\(self.data[indexPath.row]["avatar"]!)")
    let imagedata = NSData(contentsOf:imageurl!)
    cell.imgview?.image = UIImage(data:imagedata!as Data)
    
//    let imageurl2 = URL(string: "\(self.data2[indexPath.row]["avatar"]!)")
//    let imagedata2 = NSData(contentsOf:imageurl2!)
//    cell.imgview?.image = UIImage(data:imagedata2!as Data)
    
        return cell
    }
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

}
        
