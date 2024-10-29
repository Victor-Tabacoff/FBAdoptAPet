import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
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
                    .foregroundColor(.white)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.roundedBorder)
                Button{
                    //code
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
                    //code
                } label: {
                    Text("Already Have An Account? Login")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 350)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
