
import SwiftUI

struct OptionalView: View {
    
    @State var text = ""
    
    var body: some View {
        Text(text)
    }
}




struct OptionalView_Previews: PreviewProvider {
    static var previews: some View {
        OptionalView()
    }
}
