//
//  Spot.swift
//  Spotbirdparking
//
//  Created by user138340 on 8/20/18.
//  Copyright © 2018 Spotbird. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import SDWebImage

class Spot {
    var address: String
    var town: String
    var state: String
    var zipCode: String
    
    var spotImage1: UIImage
    var spotImage: String
    var description: String
    var monStartTime: String
    var monEndTime: String
    var tueStartTime: String
    var tueEndTime: String
    var wedStartTime: String
    var wedEndTime: String
    var thuStartTime: String
    var thuEndTime: String
    var friStartTime: String
    var friEndTime: String
    var satStartTime: String
    var satEndTime: String
    var sunStartTime: String
    var sunEndTime: String
    
    var monOn: Bool
    var tueOn: Bool
    var wedOn: Bool
    var thuOn: Bool
    var friOn: Bool
    var satOn: Bool
    var sunOn: Bool
    
    var hourlyPricing: String
    var dailyPricing: String
    var weeklyPricing: String
    var monthlyPricing: String
    
    var weeklyOn: Bool
    var monthlyOn: Bool
    var index: Int
    var approved: Bool
    var spot_id: String
    
     var refArtists: DatabaseReference!
    
    
    init?(address: String, town: String, state: String, zipCode: String,spotImage: String, description: String, monStartTime: String, monEndTime: String, tueStartTime: String, tueEndTime: String, wedStartTime: String, wedEndTime: String, thuStartTime: String, thuEndTime: String, friStartTime: String, friEndTime: String, satStartTime: String, satEndTime: String, sunStartTime: String, sunEndTime: String, monOn: Bool, tueOn: Bool, wedOn: Bool, thuOn: Bool, friOn: Bool, satOn: Bool, sunOn: Bool, hourlyPricing: String, dailyPricing: String, weeklyPricing: String, monthlyPricing: String, weeklyOn: Bool, monthlyOn: Bool, index: Int, approved: Bool,spotImages:UIImage,spots_id:String) {
        
        self.address = address
        self.town = town
        self.state = state
        self.zipCode = zipCode
        
        self.spotImage = spotImage
        self.spotImage1 = spotImages
        self.description = description
        
        self.monStartTime = monStartTime
        self.monEndTime = monEndTime
        self.tueStartTime = tueStartTime
        self.tueEndTime = tueEndTime
        self.wedStartTime = wedStartTime
        self.wedEndTime = wedEndTime
        self.thuStartTime = thuStartTime
        self.thuEndTime = thuEndTime
        self.friStartTime = friStartTime
        self.friEndTime = friEndTime
        self.satStartTime = satStartTime
        self.satEndTime = satEndTime
        self.sunStartTime = sunStartTime
        self.sunEndTime = sunEndTime
        
        self.monOn = monOn
        self.tueOn = tueOn
        self.wedOn = wedOn
        self.thuOn = thuOn
        self.friOn = friOn
        self.satOn = satOn
        self.sunOn = sunOn
        
        self.hourlyPricing = hourlyPricing
        self.dailyPricing = dailyPricing
        self.weeklyPricing = weeklyPricing
        self.monthlyPricing = monthlyPricing
        self.weeklyOn = weeklyOn
        self.monthlyOn = monthlyOn
        self.index = index
        self.approved = approved
        self.spot_id = spots_id
    }
    
   func getSpots() {
    
    self.refArtists = Database.database().reference().child("User").child(AppState.sharedInstance.userid).child("MySpots");
    self.refArtists.observe(DataEventType.value, with: { (snapshot) in
        
        if snapshot.childrenCount > 0 {
            AppState.sharedInstance.spots.removeAll()
            for artists in snapshot.children.allObjects as! [DataSnapshot] {
                let snapshotValue = ((snapshot.value as! NSDictionary).value(forKey: (artists as! DataSnapshot).key)) as! NSDictionary
                
                AppState.sharedInstance.spots.append(Spot(address: snapshotValue.value(forKey: "address") as!
                    String, town: snapshotValue.value(forKey: "city") as! String,
                            state: snapshotValue.value(forKey: "state") as! String,
                            zipCode:(snapshotValue.value(forKey: "zipcode") as? String)!,
                            
                            spotImage: snapshotValue.value(forKey: "image") as! String,
                            description: snapshotValue.value(forKey: "description") as! String,
                            
                            monStartTime: snapshotValue.value(forKey: "monStartTime") as! String,
                            monEndTime: snapshotValue.value(forKey: "monEndTime") as! String,
                            tueStartTime:(snapshotValue.value(forKey: "tueStartTime") as? String)!,
                            tueEndTime: snapshotValue.value(forKey: "tueEndTime") as! String,
                            wedStartTime: snapshotValue.value(forKey: "wedStartTime") as! String,
                            wedEndTime: snapshotValue.value(forKey: "wedEndTime") as! String,
                            thuStartTime: snapshotValue.value(forKey: "thuStartTime") as! String,
                            thuEndTime: snapshotValue.value(forKey: "tueEndTime") as! String,
                            friStartTime: snapshotValue.value(forKey: "friStartTime") as! String,
                            friEndTime: snapshotValue.value(forKey: "friEndTime") as! String,
                            satStartTime: snapshotValue.value(forKey: "satStartTime") as! String,
                            satEndTime: snapshotValue.value(forKey: "satEndTime") as! String,
                            sunStartTime: snapshotValue.value(forKey: "sunStartTime") as! String,
                            sunEndTime: snapshotValue.value(forKey: "sunEndTime") as! String,
                            
                            monOn: snapshotValue.value(forKey: "monswitch") as! Bool,
                            tueOn:snapshotValue.value(forKey: "tueswitch") as! Bool,
                            wedOn: snapshotValue.value(forKey: "wedswitch") as! Bool,
                            thuOn: snapshotValue.value(forKey: "thuswitch") as! Bool,
                            friOn: snapshotValue.value(forKey: "friswitch") as! Bool,
                            satOn: snapshotValue.value(forKey: "satswitch") as! Bool,
                            sunOn: snapshotValue.value(forKey: "sunswitch") as! Bool,
                            
                            hourlyPricing: snapshotValue.value(forKey: "hourlyPricing") as! String,
                            dailyPricing: snapshotValue.value(forKey: "dailyPricing") as! String,
                            weeklyPricing: snapshotValue.value(forKey: "weeklyPricing") as! String,
                            monthlyPricing: snapshotValue.value(forKey: "monthlyPricing") as! String,
                            
                            weeklyOn: snapshotValue.value(forKey: "switch_weekly") as! Bool,
                            monthlyOn: snapshotValue.value(forKey: "switch_monthly") as! Bool,
                            index: -1,
                            approved:false, spotImages: UIImage.init(named: "white")!, spots_id: (artists as! DataSnapshot).key)!)
                
            }
           
        }
        
    })
  
    }
    
    func Delete_Spots(spot_dict:Spot,index:Int) {
  
        
        let url = spot_dict.spotImage
        let start = url.index(url.startIndex, offsetBy: 80)
        let end = url.index(url.endIndex, offsetBy: -53)
        let range = start..<end
        let imgname = url[range]
        print(imgname)
        
        let pictureRef = Storage.storage().reference().child("spot//\(imgname)")
        pictureRef.delete { error in
            if let error = error {
                // Uh-oh, an error occurred!
            } else {
                // File deleted successfully
            }
        }
        refArtists = Database.database().reference().child("User").child(AppState.sharedInstance.userid)
        
        refArtists.child("MySpots").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild((spot_dict.spot_id)){
                self.refArtists = Database.database().reference().child("User").child(AppState.sharedInstance.userid).child("MySpots")
                self.refArtists.child(spot_dict.spot_id).setValue(nil)
                
                self.refArtists = Database.database().reference().child("All_Spots")
                self.refArtists.child(spot_dict.spot_id).setValue(nil)
            }else{
                print("jewsasassasass")
            }
        })
        
        AppState.sharedInstance.spots.remove(at: index)
    }
    
    func Save_Spot(SpotID:String){
        Spinner.start()
        print(AppState.sharedInstance.lat)
        print(AppState.sharedInstance.long)
    
        if SpotID == ""{
        // ADD NEW SPOT
         New_Spot()
        }else{
         // UPDATE SPOT
          Update_SpotS()
        }
     }
    
    func New_Spot(){
        var Image = UIImageView()
        Image.image = AppState.sharedInstance.activeSpot.spotImage1
        
        var imageReference: StorageReference {
            return Storage.storage().reference().child("spot")
        }
        
        guard let image = Image.image else { return }
        guard let imageData = UIImageJPEGRepresentation(image, 0.5) else { return }
        let uploadImageRef = imageReference.child(randomStringWithLength(length: 5) as String)
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print("UPLOAD TASK FINISHED")
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
            
            uploadImageRef.downloadURL(completion: { (url, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                if let url = url?.absoluteString {
                    let fullURL = url
                    print(fullURL)
                    self.refArtists = Database.database().reference().child("All_Spots")
                    let key = self.refArtists.childByAutoId().key
                    
                    let spots = ["id":key,
                                 "image":fullURL,
                                 "description":AppState.sharedInstance.activeSpot.description,
                                 "address":AppState.sharedInstance.activeSpot.address,
                                 "city":AppState.sharedInstance.activeSpot.town,
                                 "state":AppState.sharedInstance.activeSpot.state,
                                 "zipcode":AppState.sharedInstance.activeSpot.zipCode,
                                 
                                 "monStartTime":AppState.sharedInstance.activeSpot.monStartTime,
                                 "monEndTime":AppState.sharedInstance.activeSpot.monEndTime,
                                 "tueStartTime":AppState.sharedInstance.activeSpot.tueStartTime,
                                 "tueEndTime":AppState.sharedInstance.activeSpot.tueEndTime,
                                 "wedStartTime":AppState.sharedInstance.activeSpot.wedStartTime,
                                 "wedEndTime":AppState.sharedInstance.activeSpot.wedEndTime,
                                 "thuStartTime":AppState.sharedInstance.activeSpot.thuStartTime,
                                 "thuEndTime":AppState.sharedInstance.activeSpot.thuEndTime,
                                 "friStartTime":AppState.sharedInstance.activeSpot.friStartTime,
                                 "friEndTime":AppState.sharedInstance.activeSpot.friEndTime,
                                 "satStartTime":AppState.sharedInstance.activeSpot.satStartTime,
                                 "satEndTime":AppState.sharedInstance.activeSpot.satEndTime,
                                 "sunStartTime":AppState.sharedInstance.activeSpot.sunStartTime,
                                 "sunEndTime":AppState.sharedInstance.activeSpot.sunEndTime,
                                 "dailyPricing":AppState.sharedInstance.activeSpot.dailyPricing,
                                 "hourlyPricing":AppState.sharedInstance.activeSpot.hourlyPricing,
                                 "weeklyPricing":AppState.sharedInstance.activeSpot.hourlyPricing,
                                 "monthlyPricing":AppState.sharedInstance.activeSpot.hourlyPricing,
                                 "switch_weekly":AppState.sharedInstance.activeSpot.weeklyOn,
                                 "switch_monthly":AppState.sharedInstance.activeSpot.monthlyOn,
                                 "user_lat":AppState.sharedInstance.lat,
                                 "user_long":AppState.sharedInstance.long,
                                 "monswitch":AppState.sharedInstance.activeSpot.monOn,
                                 "tueswitch":AppState.sharedInstance.activeSpot.tueOn,
                                 "wedswitch":AppState.sharedInstance.activeSpot.wedOn,
                                 "thuswitch":AppState.sharedInstance.activeSpot.thuOn,
                                 "friswitch":AppState.sharedInstance.activeSpot.friOn,
                                 "satswitch":AppState.sharedInstance.activeSpot.satOn,
                                 "sunswitch":AppState.sharedInstance.activeSpot.sunOn,
                                 ] as [String : Any]
                    
                    print(spots)
                    self.refArtists = Database.database().reference().child("All_Spots").child(AppState.sharedInstance.userid)
                    self.refArtists.child(key!).setValue(spots)
                    
                    self.refArtists = Database.database().reference().child("User").child(AppState.sharedInstance.userid).child("MySpots");
                    self.refArtists.child(key!).setValue(spots){
                        (error:Error?, ref:DatabaseReference) in
                        if let error = error {
                            print("Data could not be saved: \(error).")
                               Spinner.stop()
                      
                        } else {
                            print("Data saved successfully!")
                              Spinner.stop()
                        }
                    }
                    
                }
            })
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        
        uploadTask.resume()
    }
    
    // Update SPOTS
    func Update_SpotS()
    {
         let img_url = (AppState.sharedInstance.activeSpot.spotImage)
        print(img_url)
        let startIndex = img_url.index((img_url.startIndex), offsetBy: 80)
        let endIndex = img_url.index((img_url.startIndex), offsetBy: 84)
        let imgname =  String(img_url[startIndex...endIndex])
        print(imgname)
        
        var Image = UIImageView()
        Image.image = AppState.sharedInstance.activeSpot.spotImage1
        
        
        var imageReference: StorageReference {
            return Storage.storage().reference().child("spot")
        }
        
        guard let imageData = UIImageJPEGRepresentation(Image.image!, 0.5) else { return }
        let uploadImageRef = imageReference.child(String(imgname))
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print("UPLOAD TASK FINISHED")
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
            
            uploadImageRef.downloadURL(completion: { (url, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                if let url = url?.absoluteString {
                    let fullURL = url
                    print(fullURL)
                    // Public
                    self.refArtists = Database.database().reference().child("All_Spots").child(AppState.sharedInstance.userid).child(AppState.sharedInstance.activeSpot.spot_id)
                    self.updatequery(data:  self.refArtists,url: fullURL)
                    // Private
                    self.refArtists = Database.database().reference().child("User").child(AppState.sharedInstance.userid).child("MySpots").child(AppState.sharedInstance.activeSpot.spot_id);
                    self.updatequery(data:  self.refArtists,url: fullURL)
                    
                }
            })
        }
    }
    
    func updatequery(data:DatabaseReference,url:String) {
        
        self.refArtists.updateChildValues([
            "image":url,
            "description":AppState.sharedInstance.activeSpot.description,
            "address":AppState.sharedInstance.activeSpot.address,
            "city":AppState.sharedInstance.activeSpot.town,
            "state":AppState.sharedInstance.activeSpot.state,
            "zipcode":AppState.sharedInstance.activeSpot.zipCode,
            
            "monStartTime":AppState.sharedInstance.activeSpot.monStartTime,
            "monEndTime":AppState.sharedInstance.activeSpot.monEndTime,
            "tueStartTime":AppState.sharedInstance.activeSpot.tueStartTime,
            "tueEndTime":AppState.sharedInstance.activeSpot.tueEndTime,
            "wedStartTime":AppState.sharedInstance.activeSpot.wedStartTime,
            "wedEndTime":AppState.sharedInstance.activeSpot.wedEndTime,
            "thuStartTime":AppState.sharedInstance.activeSpot.thuStartTime,
            "thuEndTime":AppState.sharedInstance.activeSpot.thuEndTime,
            "friStartTime":AppState.sharedInstance.activeSpot.friStartTime,
            "friEndTime":AppState.sharedInstance.activeSpot.friEndTime,
            "satStartTime":AppState.sharedInstance.activeSpot.satStartTime,
            "satEndTime":AppState.sharedInstance.activeSpot.satEndTime,
            "sunStartTime":AppState.sharedInstance.activeSpot.sunStartTime,
            "sunEndTime":AppState.sharedInstance.activeSpot.sunEndTime,
            "dailyPricing":AppState.sharedInstance.activeSpot.dailyPricing,
            "hourlyPricing":AppState.sharedInstance.activeSpot.hourlyPricing,
            "weeklyPricing":AppState.sharedInstance.activeSpot.hourlyPricing,
            "monthlyPricing":AppState.sharedInstance.activeSpot.hourlyPricing,
            "switch_weekly":AppState.sharedInstance.activeSpot.weeklyOn,
            "switch_monthly":AppState.sharedInstance.activeSpot.monthlyOn,
            "user_lat":AppState.sharedInstance.lat,
            "user_long":AppState.sharedInstance.long,
            "monswitch":AppState.sharedInstance.activeSpot.monOn,
            "tueswitch":AppState.sharedInstance.activeSpot.tueOn,
            "wedswitch":AppState.sharedInstance.activeSpot.wedOn,
            "thuswitch":AppState.sharedInstance.activeSpot.thuOn,
            "friswitch":AppState.sharedInstance.activeSpot.friOn,
            "satswitch":AppState.sharedInstance.activeSpot.satOn,
            "sunswitch":AppState.sharedInstance.activeSpot.sunOn,
            ]){
                (error:Error?, ref:DatabaseReference) in
                if let error = error {
                    print("Data could not be Update: \(error).")
                     Spinner.stop()
              
                } else {
                    print("Data Update successfully!")
                     Spinner.stop()
           
                }
        }
    }
    
 
   /*
    
    init() {
        
        self.address = ""
        self.town = ""
        self.state = ""
        self.zipCode = ""

     // self.spotImage = UIImage.init(named: "emptySpot")!
        self.spotImage = ""
        self.description = ""
        
        self.monStartTime = "12:00 AM"
        self.monEndTime = "12:00 PM"
        self.tueStartTime = "12:00 AM"
        self.tueEndTime = "12:00 PM"
        self.wedStartTime = "12:00 AM"
        self.wedEndTime = "12:00 PM"
        self.thuStartTime = "12:00 AM"
        self.thuEndTime = "12:00 PM"
        self.friStartTime = "12:00 AM"
        self.friEndTime = "12:00 PM"
        self.satStartTime = "12:00 AM"
        self.satEndTime = "12:00 PM"
        self.sunStartTime = "12:00 AM"
        self.sunEndTime = "12:00 PM"
        
        self.monOn = true
        self.tueOn = true
        self.wedOn = true
        self.thuOn = true
        self.friOn = true
        self.satOn = true
        self.sunOn = true
        
        self.hourlyPricing = ""
        self.dailyPricing = ""
        self.weeklyPricing = ""
        self.monthlyPricing = ""
        
        self.weeklyOn = true
        self.monthlyOn = true
        
        self.index = -1
        self.approved = false
    }
    */
    
    func calculateReccomendedPricing() -> Array<String> {
        let hourlyPricingString = "1.00"
        let dailyPricingString = "7.00"
        let weeklyPricingString = "35.00"
        let monthlyPricingString = "105.00"
        
        return [hourlyPricingString, dailyPricingString, weeklyPricingString, monthlyPricingString]
    }
    
    func applyCalculatedPricing() {
        var pricing = calculateReccomendedPricing()
        self.hourlyPricing = pricing[0]
        self.dailyPricing = pricing[1]
        self.weeklyPricing = pricing[2]
        self.monthlyPricing = pricing[3]
    }
    
    // check in on the state of Spot
    func pringSpotCliffNotes() {
        print(self.address)
        print(self.description)
        print(self.monStartTime)
        print(self.monEndTime)
        print(self.hourlyPricing)
    }
    
    func randomStringWithLength(length: Int) -> NSString {
        let characters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString: NSMutableString = NSMutableString(capacity: length)
        
        for i in 0..<length {
            let len = UInt32(characters.length)
            let rand = arc4random_uniform(len)
            randomString.appendFormat("%C", characters.character(at: Int(rand)))
        }
        return randomString
    }
}











