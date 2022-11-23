import SwiftUI

struct VisualView: View {
    var body: some View {
        VStack {
            Text("Swift UI! OMG")
                .foregroundColor(.green)
                .offset(x: -100, y: 0)
            padding(.bottom, 15)
        }
        HStack {
            Text("Hello world")
            Text("Good Boy Chappi")
            padding(.leading, 16)
        }
    }
}













//MARK: Previews

struct VisualView_Previews: PreviewProvider {
    static var previews: some View {
        VisualView()
    }
}
