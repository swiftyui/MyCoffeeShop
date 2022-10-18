import Foundation
import CloudKit
import UIKit

class UserModel: ObservableObject {
    
    /// Published variables
    @Published var loggedIn: Bool = false
    @Published var loading: Bool = false
    @Published var userData: UserData = UserData(id: "", username: "", password: "", firstname: "", lastname: "", emailAddress: "")
    
    /// Errors
    enum validationError: Error {
        case userNotFound
        case incorrectPassword
        
        var errorDescription: String? {
            switch self {
            case .userNotFound:
                return "Username not found"
            case .incorrectPassword:
                return "Incorrect password"
            }
            
        }
    }
    
    
    /// Type Aliases
    typealias UserCompletion = (UserData) -> Void
    
    
    func SaveUser(userData: UserData, completion: @escaping (Bool) -> ()) throws {
        
        let newRecord = CKRecord(recordType: "User")
        newRecord.setValuesForKeys([
            "id": userData.id,
            "username": userData.username,
            "password": userData.password,
            "firstname": userData.firstname,
            "lastname": userData.lastname,
            "emailAddress": userData.emailAddress
        ])
        
        database.save(newRecord, completionHandler: { record, error in
            do { sleep(4) }
            completion(true)
        })
    }
    
    private func getUserByUsername(username: String, completion: @escaping UserCompletion) {
        let foundUserData: UserData = UserData(id: "", username: "", password: "", firstname: "", lastname: "", emailAddress: "")
        let filter = username
        let predicate = NSPredicate(format: "username == %@", filter )
        let query = CKQuery(recordType: "User", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "username", ascending: true)]
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["id", "username", "password", "firstname", "lastname", "emailAddress"]
        database.add(operation)
        
        operation.queryResultBlock = { result in
            switch result {
            case .success(let cursor):
                if( cursor != nil)
                {
                    let NewOperation = CKQueryOperation(cursor: cursor.unsafelyUnwrapped)
                    NewOperation.queryResultBlock = operation.queryResultBlock
                    NewOperation.recordMatchedBlock = operation.recordMatchedBlock
                    database.add(NewOperation)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        operation.recordMatchedBlock = { recordID, result in
            switch result {
            case .success(let record):
                record.setValuesForKeys([
                    "id": foundUserData.id,
                    "username": foundUserData.username,
                    "password": foundUserData.password,
                    "firstname": foundUserData.firstname,
                    "lastname": foundUserData.lastname,
                    "emailAddress": foundUserData.emailAddress
                ])
                completion(foundUserData)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func login(username: String, password: String) throws {
        self.loading = true
        getUserByUsername(username: username) { foundUser in
            self.userData = foundUser
            self.loggedIn = true
            self.loading  = false
        }
    }
}
