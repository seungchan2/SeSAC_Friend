//
//  HomeViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/08.
//

import UIKit

import CoreLocation
import CoreLocationUI
import MapKit

final class HomeViewController: BaseViewController {
    
    // 홈 뷰 수정 필요 ~ 서버 통신

    let homeView = HomeView()
    let locationManager = CLLocationManager()
    
    override func loadView() {
        view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegation()
        checkUserLocationServicesAuthorization()
        setAddTarget()
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
    
    private func setDelegation() {
        homeView.mapView.delegate = self
        locationManager.delegate = self
    }
    
    private func setAddTarget() {
        homeView.gpsButton.addTarget(self, action: #selector(gpsButtonClicked), for: .touchUpInside)
    }
    
    @objc func gpsButtonClicked() {
          // 현재 위치 가져오도록 설정해야함
      }
      
      func setupView() {
          view.addSubview(homeView)
      }
      
      func setupConstraints() {
          homeView.snp.makeConstraints { make in
              make.top.equalToSuperview()
              make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
          }
      }
}

extension HomeViewController: CLLocationManagerDelegate {
    
    func checkUserLocationServicesAuthorization() {
        let authorizationStatus: CLAuthorizationStatus
        if #available(iOS 14.0, *) {
            authorizationStatus = locationManager.authorizationStatus
        }
        else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization(authorizationStatus)
        }
        else {
            print("locationServicesXXX")
        }
    }
    
    // 사용자의 권한 상태 확인
    func checkCurrentLocationAuthorization(_ authorizationStatus: CLAuthorizationStatus) {
        
        switch authorizationStatus {
            // 앱이 위치 서비스를 사용할 수 있는지에 대한 여부를 사용자가 선택하지 않은 경우
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
        // 앱이 위치 서비스를 사용할 권한이 없는 경우
        case .restricted, .denied:
            // 사용자가 설정으로 가서 권한 설정할 수 있게 만들기
            print("restricted")
        
        // 앱이 사용 중인 동안 위치 서비스를 시작하도록 승인
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        
        // 앱이 언제든지 위치 서비스를 시작할 수 있도록 승인
        case .authorizedAlways:
            print("Always")
            
        @unknown default:
            print("Default")
        }
        
        if #available(iOS 14.0, *) {
            //정확도 체크: 1시간 4번으로 제한
            let accuracyState = locationManager.accuracyAuthorization
            switch accuracyState {
            // 완전한 정확도
            case .fullAccuracy:
                print("fullAccuracy")
            // 낮은 정확도
            case .reducedAccuracy:
                print("reducedAccuracy")
            @unknown default:
                print("accurancyState Default")
            }
        }
    }
    
    
    // 4) 사용자가 앱 내에서 위치 허용을 한 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("didUpdateLocations")

        if let coordinate = locations.last?.coordinate {
            let annotation = MKPointAnnotation()
            annotation.title = "현재 내 위치"
            annotation.coordinate = coordinate
            homeView.mapView.addAnnotation(annotation)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            print(region)
            homeView.mapView.setRegion(region, animated: true)
            locationManager.stopUpdatingLocation()
        }

        else {
            print("Location Cannot Find")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("locationManagerDidChangeAuthorization")
        checkUserLocationServicesAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkUserLocationServicesAuthorization()
    }

}

extension HomeViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
        guard let annotation = annotation as? CustomAnnotation else {
            return nil
        }
           
        var annotationView = self.homeView.mapView.dequeueReusableAnnotationView(withIdentifier: CustomAnnotationView.identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: CustomAnnotationView.identifier)
            annotationView?.canShowCallout = false
            annotationView?.contentMode = .scaleAspectFit
            
        } else {
            annotationView?.annotation = annotation
        }
         
        let annotationImage: UIImage!
        let size = CGSize(width: 85, height: 85)
        UIGraphicsBeginImageContext(size)
        
        switch annotation.mode {
        case .mapMarker:
            annotationImage = Image.sesacMapMarker
        case .green:
            annotationImage = Image.sesacAnnotationGreen
        case .purple:
            annotationImage = Image.sesacAnnotationPurple
        case .lightGreen:
            annotationImage = Image.sesacAnnotationLightGreen
        case .yellow:
            annotationImage = Image.sesacAnnotationYellow
        }

        annotationImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        annotationView?.image = resizedImage
        
        return annotationView
    }
        
    func addCustomAnnotation(Location: CLLocationCoordinate2D, mode: AnnotationMode) {
        let missionDoloresCoor = Location
        let pin = CustomAnnotation(coor: missionDoloresCoor, mode: mode)
        self.homeView.mapView.addAnnotation(pin)
    }
}
