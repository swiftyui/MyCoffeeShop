import SwiftUI

struct SignUpView: View {
    @State private var userData: UserData = UserData(id: "", username: "", password: "", firstname: "", lastname: "", emailAddress: "")
    @ObservedObject var userModel: UserModel
    @Environment(\.presentationMode) var presentationMode
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var currentPage = 0
    let numPages: Int = 3
    @State var timeRemaining = 2
    private let spacing: CGFloat = 12
    private let dotSize: CGFloat = 12
    
    var body: some View {
        VStack {
            
            if( self.currentPage == 0)
            {
                /// Personal Details View
                LottieView(lottieFile: "personalInfo", loopMode: .playOnce).frame(height: 200)
                GroupBox {
                    HStack {
                        Text("First name:")
                        TextField("First name....", text: $userData.firstname )
                    }
                    HStack {
                        Text("Last name:")
                        TextField("Last name....", text: $userData.firstname )
                    }
                    Button(role: .none, action: {  self.currentPage += 1})
                    {
                        HStack {
                            Text("Next").frame(width: 200)
                            Image(systemName: "checkmark.seal.fill")
                        }
                        
                    }
                    .padding()
                    .buttonStyle(ColorButton(color: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/))
                    
                } label: { Label("Personal details", systemImage: "pencil.line") }.padding().shadow(radius: 8)
                    .groupBoxStyle(ColoredGroupBox(color: .white))
            }
            else if ( self.currentPage == 1 )
            {
                /// Contact Details View
                LottieView(lottieFile: "email", loopMode: .playOnce).frame(height: 200)
                GroupBox {
                    HStack {
                        Text("Email address:")
                        TextField("Email address....", text: $userData.emailAddress ).keyboardType(.emailAddress)
                    }
                    
                    Button(role: .none, action: {  self.currentPage += 1})
                    {
                        HStack {
                            Text("Next").frame(width: 200)
                            Image(systemName: "checkmark.seal.fill")
                        }
                        
                    }
                    .padding()
                    .buttonStyle(ColorButton(color: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/))
                    
                } label: { Label("Contact details", systemImage: "envelope.fill") }.padding().shadow(radius: 8)
                    .groupBoxStyle(ColoredGroupBox(color: .white))
            }
            else if ( self.currentPage == 2)
            {
                /// Account Details View
                LottieView(lottieFile: "password", loopMode: .playOnce).frame(height: 200)
                GroupBox {
                    HStack {
                        Text("Username:")
                        TextField("Username....", text: $userData.username ).keyboardType(.emailAddress)
                    }
                    
                    HStack {
                        Text("Password:")
                        TextField("Password....", text: $userData.password ).keyboardType(.emailAddress)
                    }
                    
                    Button(role: .none, action: {  self.currentPage += 1})
                    {
                        HStack {
                            Text("Next").frame(width: 200)
                            Image(systemName: "checkmark.seal.fill")
                        }
                        
                    }
                    .padding()
                    .buttonStyle(ColorButton(color: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.818, brightness: 0.903)/*@END_MENU_TOKEN@*/))
                    
                } label: { Label("Account details", systemImage: "person.fill") }.padding().shadow(radius: 8)
                    .groupBoxStyle(ColoredGroupBox(color: .white))
            }
            else if ( self.currentPage >= 3 )
            {
                LottieView(lottieFile: "celebrate2", loopMode: .loop).onReceive(timer) {_ in
                        if ( timeRemaining > 0 )
                        {
                            timeRemaining -= 1
                        }
                        if (timeRemaining <= 0)
                        {
                            timer.upstream.connect().cancel()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                Text( "Account created")
                Spacer()
            }
            
            
            if (self.currentPage < 3)
            {
                HStack(alignment: .center, spacing: spacing) {
                    ForEach(0 ..< numPages, id: \.self) {
                        DotIndicator(pageIndex: $0, isOn: self.$currentPage, colorNotSelected: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.815, brightness: 0.767)/*@END_MENU_TOKEN@*/, colorSelected: /*@START_MENU_TOKEN@*/Color(hue: 0.523, saturation: 0.813, brightness: 0.624)/*@END_MENU_TOKEN@*/)
                            .frame(width: self.dotSize, height: self.dotSize)
                    }
                }
            }
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.width < 0 {
                                    // left
                                    if (self.currentPage < 3)
                                    {
                                        self.currentPage += 1
                                    }
                                }

                                if value.translation.width > 0 {
                                    // right
                                    if (self.currentPage > 0)
                                    {
                                        self.currentPage -= 1
                                    }
                                }
                                if value.translation.height < 0 {
                                    // up
                                }

                                if value.translation.height > 0 {
                                    // down
                                }
                            }))
    }
}



