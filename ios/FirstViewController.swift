import UIKit
import MapKit
import CoreLocation



class FirstViewController: UIViewController {

    //@IBOutlet var Map: MKMapView!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var location = CLLocationCoordinate2DMake(
            47.809490,
            13.055010
        )
        
        var annotation = ColorPointAnnotation(pinColor: UIColor.yellow)
        
        annotation.coordinate = location
        annotation.title = "bla"
        annotation.subtitle = "subbla"
        
        map.addAnnotation(annotation)
        
        
        
        
        //let requestURL: NSURL = NSURL(string: "https://api.yellowdesks.com/hosts?format=json")!
        
        let requestURL = NSURL( string: "https://api.yellowdesks.com/hosts?format=json")
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL as! URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                print (data)
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

