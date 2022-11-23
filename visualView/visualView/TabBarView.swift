import SwiftUI

struct TabBarView: View {
    @State var isPresented = false
    @State var selection = 0
   
    var body: some View {
        
        TabView(selection: $selection) {
        
            ContentView()
                .tabItem {
                    Image(systemName: "star")
                    Text("First VC") }
                .tag(1)
          
            DetailView(isPresented: $isPresented)
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("Second VC") }
                .tag(2)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
