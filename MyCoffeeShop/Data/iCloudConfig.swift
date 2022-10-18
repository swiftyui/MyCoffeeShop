import Foundation
import CloudKit

var containerIdentifier = "iCloud.vanzylarno.MyCoffeeShop"
var container = CKContainer(identifier: containerIdentifier)
var database = container.privateCloudDatabase
