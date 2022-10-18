import Foundation

struct UserData: Identifiable, Codable, Hashable, Equatable {
    var id: String
    var username: String
    var password: String
    var firstname: String
    var lastname: String
    var emailAddress: String
    
    init(id: String, username: String, password: String, firstname: String, lastname: String, emailAddress: String) {
        self.id = id
        self.username = username
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
        self.emailAddress = emailAddress
    }
}
