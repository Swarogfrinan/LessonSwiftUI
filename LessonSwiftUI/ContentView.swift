import SwiftUI

struct FilterView : View {
    @Binding var filterText : String
    var body: some View {
        TextField("Enter text to search", text: $filterText)
    }
}
struct ToggleView : View {
    @EnvironmentObject var viewModel : DrinkListViewModel
    @Binding var isToggleOn: Bool
    var body: some View {
        Toggle(viewModel.toggleName, isOn: $isToggleOn)
            .padding()
        Image(systemName: "person").imageScale(.large)
    }
}

@propertyWrapper
struct Squared {
    private(set) var value : Int = 0
    var wrappedValue: Int {
        get { return value }
        set {
            value = newValue * newValue
        }
    }
    init(wrappedValue initalValue : Int) {
        self.wrappedValue = initalValue
    }
}

@propertyWrapper
struct Trimmed {
    private(set) var value : String = ""
    var wrappedValue: String {
        get { return value }
        set {
            value = newValue.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        }
    }
    init(wrappedValue initalValue : String) {
        self.wrappedValue = initalValue
    }
}

//MARK: ContentView

struct ContentView: View {

    @State var isSelected : Bool = false
    @State var filterText: String = ""
    @ObservedObject var viewModel = DrinkListViewModel()
    @Trimmed var trimmedValue = "  Hi everyoine its me Jango ML.   "
    @Squared var squaredValue = 4
    
    //MARK: Body
    
    var body: some View {
        VStack {
            
            FilterView(filterText: $filterText)
                .foregroundColor()
                .padding()
                
            ToggleView(isToggleOn: $isSelected)
                .environmentObject(viewModel)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello world, its a me \(trimmedValue) все меня ебали по списку \(squaredValue) раз ")
            
            Text(isSelected ? "Favorite links" : "Drink list").padding()
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Show favorites")
            }
            
            .padding()
            
            Text(isSelected ? "Wow you can press the button!" : "You cant press on me ")
                
            List {
                ForEach(viewModel.drinks, id: \.self) { drink in
                    Group { if !self.isSelected || drink.favorite {
                        if !filterText.isEmpty &&
                            drink.name.lowercased()
                            .contains(filterText.lowercased()) {
                            Text(drink.name)
                        } else if filterText.isEmpty {
                            Text(drink.name)
                            Image(systemName: "person.fill")
                                .foregroundColor(.green)
                        }
                    }
                    }
                }
                .padding()
                
        }
        }
    }
}

//MARK: Previews

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
