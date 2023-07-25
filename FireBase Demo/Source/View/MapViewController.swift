//
//  MapViewController.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 19/07/23.
//

import Foundation
import UIKit
import GoogleMaps
import ANLoader

class MapViewController: UIViewController, CLLocationManagerDelegate {
//MARK: - Variable Declarations
    var viewModel = ViewModel()
    let managerLocation = CLLocationManager()
    let constants = Constants()
    let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
        ANLoader.hide()
    }
//MARK: - LifeCycle Methods
    override func viewWillAppear(_ animated: Bool) {
        ANLoader.showLoading("Loading", disableUI: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        let apiKey = constants.apiKey
        GMSServices.provideAPIKey(apiKey)
        managerLocation.delegate = self
        managerLocation.requestWhenInUseAuthorization()
        managerLocation.startUpdatingLocation()
        setUI()
    }
//MARK: - setUI Method
    func setUI()  {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        self.view.addSubview(mapView)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           viewModel.updateLocations(locations)
       }
   }
//MARK: - Delegate Methods
extension MapViewController: ViewModelDelegate {
       func didUpdateMapView(with mapView: GMSMapView) {
           self.view.addSubview(mapView)
       }
       func didUpdateMarker(with marker: GMSMarker) {
           marker.map = viewModel.mapView
       }
}

   
