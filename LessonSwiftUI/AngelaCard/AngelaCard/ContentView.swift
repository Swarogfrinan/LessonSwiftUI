
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("alexey")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 320, height: 400)
                    .clipShape(Circle())
                
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 5)
                
                Text("Ilya Vasilev")
                    .foregroundColor(Color.white)
                    .font(.system(size: 40))
                Text("IOS developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                PhoneView(text: "+7-981-951-78-43", ImageName: "phone.fill")
                PhoneView(text: "Ilyavasilev.wow@gmail.com", ImageName: "envelope.fill")
                    .padding(.all)
                }
        }
    }
}

struct PhoneView: View {
    
    let text : String
    let ImageName : String
    
    var body: some View {
                Capsule()
                    .frame(width: 380, height: 60)
                    .foregroundColor(.white)
                    .overlay(
                        HStack() {
                            
                            Image(systemName: ImageName)
                                .foregroundColor(.green)
                                
                            Text(text)
                                .foregroundColor(.black)
                                .font(.system(size: 22))
                                .padding()
                        })
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
