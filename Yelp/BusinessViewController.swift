//
//  BusinessViewController.swift
//  Yelp
//
//  Created by John Law on 17/2/2017.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class BusinessViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var business: Business!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension

        /*
        let name = business.name
        let categories = business.categories
        let address = business.address!
        let distance = business.distance
        let imageUrl = business.imageURL
        //let imageRequest = URLRequest(url: imageUrl!)
        let ratingImageUrl = business.ratingImageURL
        //let ratingImageRequest = URLRequest(url: imageUrl!)
        let reviewCount = business.reviewCount
        
        
        
        self.nameLabel.text = name
        self.categoriesLabel.text = categories
        //self.addressLabel.text = address
        self.distanceLabel.text = distance
        self.reviewLabel.text = "\(reviewCount!) Reviews"

        if let imageUrl = imageUrl {
            //self.thumbImageView.setImageWith(imageUrl)
        }
        self.ratingImageView.setImageWith(ratingImageUrl!)
        */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! InfoCell
            let name = business.name
            let categories = business.categories
            let distance = business.distance
            let imageUrl = business.imageURL
            //let imageRequest = URLRequest(url: imageUrl!)
            let ratingImageUrl = business.ratingImageURL
            //let ratingImageRequest = URLRequest(url: imageUrl!)
            let reviewCount = business.reviewCount
            
            
            
            cell.nameLabel.text = name
            cell.categoriesLabel.text = categories
            cell.distanceLabel.text = distance
            cell.reviewLabel.text = "\(reviewCount!) Reviews"
            
            cell.ratingImageView.setImageWith(ratingImageUrl!)
            
            cell.selectionStyle = .none
            
            return cell
        }
        else if (indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
            let centerLocation = CLLocation(latitude: 37.7833, longitude: -122.4167)
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(centerLocation.coordinate, span)
            cell.mapView.setRegion(region, animated: false)
            return cell
        }
        else if (indexPath.row == 2) {
            let address = business.address
            print("address:")
            print(address!)
            let cell = tableView.dequeueReusableCell(withIdentifier: "DestinationCell", for: indexPath) as! DestinationCell
            cell.addressLabel.text = address
            return cell
        }
        print(indexPath.row)
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

}
