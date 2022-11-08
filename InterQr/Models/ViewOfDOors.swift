import Foundation
import UIKit

struct ViewOfDoors{
    var leftImage: String
    var rigtImage: String
    var sideOfDOor: String
    var placeOfDoor: String
    var status: String
    var animationTime: Float
    var fontCollor: UIColor
    var imageSize: Int?
}


struct ViewDoorsList{
   static let list: [ViewOfDoors] = [ViewOfDoors(leftImage: "imageOne", rigtImage: "blueLock", sideOfDOor: "Front Door", placeOfDoor: "Home", status: "Locked", animationTime: 2.0, fontCollor: CollorsSetings().darkBlueColor ),
                               ViewOfDoors(leftImage: "imageOne", rigtImage: "blueLock", sideOfDOor: "Front Door", placeOfDoor: "Office", status: "Locked", animationTime: 2.5, fontCollor: CollorsSetings().darkBlueColor),
                                     ViewOfDoors(leftImage: "imageOne", rigtImage: "blueLock", sideOfDOor: "Front Door", placeOfDoor: "Garage", status: "Locked", animationTime: 3.0, fontCollor: CollorsSetings().darkBlueColor), ViewOfDoors(leftImage: "imageOne", rigtImage: "blueLock", sideOfDOor: "Front Door", placeOfDoor: "Home", status: "Locked", animationTime: 3.5, fontCollor: CollorsSetings().darkBlueColor),]
}

