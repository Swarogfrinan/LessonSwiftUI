
import SwiftUI

struct ContentView: View {
    
    @State var initialState = true
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 3.0) {
                Text("Hello, world!")
                    .font(.system(size: 35))
                    .background(Color.green)
                    .offset(x: initialState ? 0 : 300, y: 0)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .shadow(color: .blue, radius: 40)
                    .padding(.horizontal, 10)
                Divider()
                
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                        .background(.blue)
                        .cornerRadius(10)
                    
                    Text("hey guys")
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .background(initialState ? Color.yellow : Color.pink)
                    
                    Image("people")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120, alignment: .center)
                        .clipShape(initialState ? RoundedRectangle(cornerRadius: 60) : RoundedRectangle(cornerRadius: 0.0))
                }
                
                Divider()
                Spacer()
                
                GeometryReader { geometry in
                    HStack(alignment: .center, spacing: .zero,  content: {
                        
                        Text("Left")
                            .font(.largeTitle)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height, alignment: .center)
                            .background(initialState ? Color.black : Color.green)
                            .foregroundColor(.white)
                        Text("Right")
                            .font(.largeTitle)
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height, alignment: .center)
                            .offset(x: initialState ? 0:300, y: 0)
                            .background(initialState ? Color.black : Color.pink)
                            .foregroundColor(.white)
                    })
                }
                .frame(height: 250, alignment: .center)
                
//                Spacer()
                
                Button("Tap on me") {
                    withAnimation(.easeInOut(duration: 2)) {
                        initialState.toggle()
                    }
                }
                
                Button("Present") {
                    isPresented.toggle()
                }
                .padding()
                .fullScreenCover(isPresented: $isPresented, content: { DetailView(isPresented: $isPresented)
                })
                Spacer()
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

