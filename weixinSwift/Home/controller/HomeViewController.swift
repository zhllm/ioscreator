//
//  HomeViewController.swift
//  weixinSwift
//
//  Created by 张杰 on 2020/3/26.
//  Copyright © 2020 张杰. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate {
    
    var selectedAnnotion: MKAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapVIew = MKMapView(frame: self.view.bounds)
        mapVIew.delegate = self
        mapVIew.mapType = .standard
        
        let cordinate2D = CLLocationCoordinate2D(latitude: 30.763701, longitude: 103.864558043276)
        
        let region = MKCoordinateRegion(center: cordinate2D, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        mapVIew.setRegion(region, animated: true)
        
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = cordinate2D
        objectAnnotation.title = "Imoerial Palace"
        objectAnnotation.subtitle = "The world's five place"
        mapVIew.addAnnotation(objectAnnotation)
        
        self.view.addSubview(mapVIew)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MKAnnotation"
        var annitationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annitationView == nil {
            annitationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        let button = UIButton(type: UIButton.ButtonType.infoDark)
        button.addTarget(self, action: #selector(showInfo), for: UIControl.Event.touchUpInside)
        annitationView?.leftCalloutAccessoryView = button
        annitationView?.image = UIImage(named: "md")
        
        self.selectedAnnotion = annotation
        annitationView?.canShowCallout = true
        
        return annitationView!
    }
    
    @objc func showInfo(_ send:UIButton) {
        let message = "This is a message toast"
        
        let alertView = UIAlertController(title: self.selectedAnnotion.title ?? "提示", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        for view in views {
            print(((view.annotation?.title)!)!)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.coordinate ?? "normal")
        print(view.annotation?.title! ?? "normal")
        print(view.annotation?.subtitle! ?? "normal")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated")
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool){
        print("regionWillChangeAnimated")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("mapViewWillStartLoadingMap")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("mapViewWillStartRenderingMap")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("mapViewDidFinishLoadingMap")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        print("mapViewDidFinishRenderingMap")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
