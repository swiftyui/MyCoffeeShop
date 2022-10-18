import SwiftUI

struct ProfileView: View {
    @State private var isPresented: Bool
    @ObservedObject var userModel: UserModel
    
    init(userModel: UserModel) {
        self.isPresented = false
        self.userModel = userModel
    }
    
    
    var body: some View {
        NavigationStack {
            
            GeometryReader { geo in
                ScrollView {
                    
                    LottieView(lottieFile: "EmptyProfile", loopMode: .loop)
                        .frame(width: 200, height: 200)
                                        
                    Divider()
                    
                    NavigationLink(destination: PersonalInfoView(userModel: userModel))
                    {
                        HStack {
                            Image(systemName: "info.square")
                            Text("Personal information")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .tint(Color.primary)
                    }
                    
                    NavigationLink(destination: PaymentView())
                    {
                        HStack {
                            Image(systemName: "creditcard")
                            Text("Payment information")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .tint(Color.primary)
                    }
                    
                    NavigationLink(destination: AchievementsView())
                    {
                        HStack {
                            Image(systemName: "trophy")
                            Text("Achievements")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .tint(Color.primary)
                    }
                    
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Text("Logout")
                        Spacer()
                        
                    }
                    .padding()
                    .foregroundColor(Color.red)
                }
            }
        }
    }
}

