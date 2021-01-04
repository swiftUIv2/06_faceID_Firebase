import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @AppStorage("status") var logged = false
    var body: some View {
        NavigationView {
//            if logged {
//             Text("User logged in...")
//                .navigationTitle("Home")
//                .navigationBarHidden(false)
////                .preferredColorScheme(.light)
//                .padding(.top, 8)
//            }else {
                Login()
//                    .preferredColorScheme(.dark)
                    .navigationBarHidden(false)
//            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




/// extension for keyboard ...
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func hideKeyBoard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
