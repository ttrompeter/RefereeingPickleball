//
//  ArchivedMatch.swift
//  PickleballReferee
//
//  Created by Tom Trompeter on 9/2/22.
//

import RealmSwift
import SwiftUI

class ArchivedMatch: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var archiveDate = Date.now
    @Persisted var eventTitle = ""
    @Persisted var matchDate = Date.now
    @Persisted var matchFinalScore = ""
    @Persisted var matchNumber = ""
    @Persisted var matchStatisticsImage = Data()
    @Persisted var namePlayer1Team1 = ""
    @Persisted var namePlayer2Team1 = ""
    @Persisted var namePlayer1Team2 = ""
    @Persisted var namePlayer2Team2 = ""
    @Persisted var scoresheetImage = Data()
    
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

//pngData() and jpegData(), both of which convert a UIImage into a Data instance you can write out.
//let image = UIImage(named: "example.png") {
//let data = image.pngData()
//func pngData() -> Data?
//let data = image.jpegData(compressionQuality: 0.8)
//func jpegData(compressionQuality: CGFloat) -> Data?
//jpegData() is a float that represents JPEG quality, where 1.0 is highest and 0.0 is lowest

// Data objet in Swift
//// Swift4
//let image = UIImage(named: "sample")
//let data = image?.pngData()
//let data = image?.jpegData(compressionQuality: 0.9)
//let uiImage: UIImage = UIImage(data: imageData)
//
//// deprecated
//// var imageData: Data = UIImagePNGRepresentation(image)


// Storing image in Realm
//let data = NSData(data: image.jpegData(compressionQuality: 0.9)!)
//    var userData = UserData()
//    userData.image = data
//
//    let realm = try! Realm()
//
//    try! realm.write {
//        realm.add(userData)
//    }

// Storing image in Realm
//class MyImageBlob {
//     var data: NSData?
// }
// // Working Example
// let url = NSURL(string: "http://images.apple.com/v/home/cb/images/home_evergreen_hero_iphone_medium.jpg")!
// if let imgData = NSData(contentsOfURL: url) {
//     var myblob = MyImageBlob()
//     myblob.data = imgData
//     let realm = try! Realm()
//     try! realm.write {
//         realm.add(myblob)
//     }
// }
