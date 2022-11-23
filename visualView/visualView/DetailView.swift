
import SwiftUI

struct DetailView: View {
    
    @Binding var isPresented : Bool
   
    
    var body: some View {
        
        NavigationView {

            VStack {
                
                Button {
                    isPresented = false
                    
                } label: {
                    Text("Button")
                }
                .padding()
                
                NavigationLink (
                    destination: OptionalView(text: "hey its optional value"),
                    label: {
                        HStack {
                            Image(systemName: "arrow")
                            Text("Next screen")
                        }
                    })
            }
            
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
}
}

struct DetailView_Previews: PreviewProvider {
    @State static var isPresented = false
    static var previews: some View {
       
        DetailView(isPresented: $isPresented)
    }
}
