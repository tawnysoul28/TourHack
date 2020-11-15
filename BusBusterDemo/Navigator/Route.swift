//
//  Route.swift
//  BusBusterDemo
//
//  Created by Bob on 15.11.2020.
//  Copyright © 2020 Bob. All rights reserved.
//

import MapKit

struct Route {


	let origin: MKMapItem = MKMapItem.forCurrentLocation()
	let stops: [MKMapItem] = []


	var firstStopCoordinates = CLLocationCoordinate2D(latitude: 55.048750, longitude: 82.915882)
	var secondStopCoordinates = CLLocationCoordinate2D(latitude: 55.023596, longitude: 82.922544)

	

//  var annotations: [MKAnnotation] {
//    var annotations: [MKAnnotation] = []
//
//    annotations.append(
//      RouteAnnotation(item: origin)
//    )
//    annotations.append(contentsOf: stops.map { stop in
//      return RouteAnnotation(item: stop)
//    })
//
//    return annotations
//  }
//
//  var label: String {
//    if let name = stops.first?.name, stops.count == 1 {
//      return "Directions to \(name)"
//    } else {
//      let stopNames = stops.compactMap { stop in
//        return stop.name
//      }
//      let namesString = stopNames.joined(separator: " and ")
//
//      return "Directions between \(namesString)"
//    }
//  }
}

// RouteAnnotation and Route

class RouteAnnotation: NSObject {
  private let item: MKMapItem

  init(item: MKMapItem) {
    self.item = item

    super.init()
  }
}

// MARK: - MKAnnotation

extension RouteAnnotation: MKAnnotation {
  var coordinate: CLLocationCoordinate2D {
    return item.placemark.coordinate
  }

  var title: String? {
    return item.name
  }
}
