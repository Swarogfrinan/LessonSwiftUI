import SwiftUI
import Combine

class DrinkListViewModel: ObservableObject {
    
    struct Drink : Identifiable, Hashable {
        let id = UUID()
        let name : String
        let favorite : Bool
    }
    
    @Published var drinks : [Drink] = [
        Drink(name: "Rom", favorite: false),
        Drink(name: "Beer IPA", favorite: true),
        Drink(name: "Vodka", favorite: false),
        Drink(name: "Juce", favorite: true),
        ]
    
    @Published var toggleName = "Switch favorite list"
}

 
