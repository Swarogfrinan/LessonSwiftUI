
import SwiftUI

struct ContentView: View {
    
   @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("diceeLogo")
                Spacer()
                
                HStack {
                diceView(number:  leftDiceNumber)
                diceView(number: rightDiceNumber)
                }
                
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    self.leftDiceNumber = Int.random(in: 1...6)
                        self.rightDiceNumber = Int.random(in: 1...6)
                } label: {
                    Text("Roll")
                        .font(.system(size: 35))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                .cornerRadius(8)
            }
        }
    }
}

struct diceView: View {
    
    let number : Int
    
    var body : some View {
        
        Image("dice\(number)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
