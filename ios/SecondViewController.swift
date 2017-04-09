import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let list = Hosts.sharedInstance.hosts as! [Dictionary<String, Any>]
        print ("count: \(list.count)")
        return list.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        let list = Hosts.sharedInstance.hosts as! [Dictionary<String, Any>]
        
        print ("list entry")
        print (list[indexPath.row]["host"])
        cell.textLabel?.text = list[indexPath.row]["host"] as? String
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

