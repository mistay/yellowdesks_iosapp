import UIKit
import MapKit
import CoreLocation
import Foundation



class FirstViewController: UIViewController {

    //@IBOutlet var Map: MKMapView!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let location = CLLocationCoordinate2DMake(
            47.809490,
            13.055010
        )
        
        let annotation = ColorPointAnnotation(pinColor: UIColor.yellow)
        
        annotation.coordinate = location
        annotation.title = "bla"
        annotation.subtitle = "subbla"
        
        map.addAnnotation(annotation)
        
        
        
        
        //let requestURL: NSURL = NSURL(string: "https://api.yellowdesks.com/hosts?format=json")!
        
        let requestURL = URL( string: "https://api.yellowdesks.com/hosts?format=json")!
        
        
        let session = URLSession.shared
        
        
        
        //let task = session.dataTask (with: urlRequest as URLRequest) {
        
        print("starting")
        let task = session.dataTask(with: requestURL) {
            (data, response, error) -> Void in
        
            print("done loading")
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                print ("mime: " + (httpResponse.mimeType)!)
    
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                
                print ("data: \(dataString)")
            }
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

