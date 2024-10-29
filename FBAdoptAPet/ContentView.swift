import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        if userIsLoggedIn{
            ListView()
        } else{
            content
        }
    }
    
    var content: some View{
        ZStack {
            Color.brown
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -100, y:-100)
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.roundedBorder)
                Button{
                    register()
                }label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.linearGradient(colors: [.yellow, .orange], startPoint: .top, endPoint: .bottomTrailing)))
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 100)
                Button{
                    login()
                } label: {
                    Text("Already Have An Account? Login")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener {auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
