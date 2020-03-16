//
//  ContentView.swift
//  PerkCM
//
//  Created by Shailendra vishwakarma on 14/03/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var input = ""
    @State var isEditing = false
     @State private var showDetails = false
    
    var body: some View {
        NavigationView {
        SwiftUIKeyboardHost {
            NavigationLink(destination: FeedbackView()) {
                Text("Go!")
            }
            
            VStack {
                
                
                Spacer()
                
                TextField("Example Title 1", text: .constant(""))
                TextField("Example Title 2", text: .constant(""))
                TextField("Example Title 3", text: .constant(""))
                TextField("Example Title 4", text: .constant(""))
                TextField("Example Title 5", text: .constant(""))
                TextField("Example Title 6", text: .constant(""))

                TextView(
                    text: self.$input,
                    isEditing: self.$isEditing,
                              placeholder: "Enter text here",
                              backgroundColor: UIColor.green
                )
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
                    
                
                Button(action: {
                    self.showDetails.toggle()
                }) {
                    Text("Show details")
                }
                Spacer()
            }
            
            if self.showDetails {
                Text("You should follow me on")
                    .font(.largeTitle)
            }
            
        }
        .background(SwifUIDismissKeyboard())
        
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
*/
