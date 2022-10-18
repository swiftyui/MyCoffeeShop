import SwiftUI

struct PersonalInfoView: View {
    @State private var name: String  = ""
    @ObservedObject var userModel: UserModel
    
    init(userModel: UserModel) {
        self.userModel = userModel
    }
    
    var body: some View {
        
        VStack {
            LottieView(lottieFile: "Contact", loopMode: .loop)
                .frame(height: 100)
            
            Form {
                Section(header: Text("Personal details")) {
                    HStack {
                        Text("First name:")
                        TextField("First name....", text: $name)
                    }
                    
                    HStack {
                        Text("Last name:")
                        TextField("Last name....", text: $name)
                    }
                    
                    HStack {
                        Text("Email address:")
                        TextField("Email address....", text: $name).keyboardType(.emailAddress)
                    }
                }
                
                Section(header: Text("Account details")) {
                    HStack {
                        Text("Username:")
                        TextField("Username....", text: $name)
                    }
                    HStack {
                        Text( "Password:")
                        SecureField("Password....", text: $name)
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Personal Information")
    }
}

