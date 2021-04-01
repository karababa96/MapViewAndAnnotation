//
//  ViewController.swift
//  Project16
//
//  Created by Ali Karababa on 1.04.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate{
    @IBOutlet var mapView: MKMapView!
    let imageView = UIImageView()
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "Home to the 2012 Summer Olympics", image: "london")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousand years ago.", image: "oslo" )
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.35008), info: "Often called the City of Ligt", image: "paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it", image: "rome")
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after Georged himself.", image: "washington")
        let ankara = Capital(title: "Ankara", coordinate: CLLocationCoordinate2D(latitude: 39.9250129, longitude: 32.8372228), info: "Capital of Turkey", image: "ankara")
        
        mapView.addAnnotations([london,oslo,paris,rome,washington,ankara])
        
        imageArray.append(UIImage(named: "london")!)
        
    
        
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
        let placeName = capital.title
        let placeInfo = capital.info
        let placeImage = capital.image
        
        let image = UIImage(named: placeImage)!
        let action = UIAlertAction()
        action.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(action)
        ac.addAction(UIAlertAction(title: "ok!", style: .default))
        self.present(ac, animated: true)
    }

}



