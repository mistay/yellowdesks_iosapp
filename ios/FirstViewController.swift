import UIKit
import MapKit
import CoreLocation
import Foundation



class FirstViewController: UIViewController, MKMapViewDelegate {

    //@IBOutlet var Map: MKMapView!
    
    @IBOutlet var map: MKMapView!
    
    
    let urlPrefix = String("https://api.yellowdesks.com")!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let requestURL = URL( string: self.urlPrefix + "/hosts?format=json")!
        let session = URLSession.shared
        
        print("downloading hosts ...")
        let task = session.dataTask(with: requestURL) {
            (data, response, error) -> Void in
        
            print("done loading")
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                Hosts.sharedInstance.hosts = try? JSONSerialization.jsonObject(with: data!, options: [])
                //print ("json: \(self.hosts)")
                self.hostsLoaded()
                
            }
        }
        
        task.resume()
    }
    
    var annotationsLoaded : Bool = false
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("mapViewDidFinishLoadingMap start")
        addAnnotations()
        print("mapViewDidFinishLoadingMap done")
    }
    func addAnnotations() {
        if Hosts.sharedInstance.hosts == nil {
            return;
        }
        
        let list = Hosts.sharedInstance.hosts as! [Dictionary<String, Any>]
        print ("hosts: \(list.count)")
        
        if (!annotationsLoaded) {
            annotationsLoaded = true

            
            print("male hosts...")
            for host in Hosts.sharedInstance.hosts as! [Dictionary<String, Any>] {
                
                
                let lat = host["lat"] as? Double
                let lng = host["lng"] as? Double
                let nickname = host["host"] as? String
                let title = host["title"] as? String
                
                print ("title: \(title)")
                if lat != nil && lng != nil && nickname != nil {
                    let location = CLLocationCoordinate2DMake(
                        lat!,
                        lng!
                    )
                    print ("location: \(location)")
                    
                    let annotation = ColorPointAnnotation(pinColor: UIColor.yellow)
                    
                    print(annotation)
                    annotation.coordinate = location
                    annotation.title = nickname
                    annotation.subtitle = title
                    
                    
                    map.addAnnotation(annotation)
                    
                    
                    print("host annotation hinzugefügt!")

                    
                    //print("lat: \(lat) lng: \(lng)")
                    
                    
                    
                }
            }
            print("fertig mit malen...")
        }
    }
    
    func hostsLoaded() {
        print("hostsLoaded() begin")
        addAnnotations()
        print("hostsLoaded() fertig")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

