//
//  BillDetailView.swift
//  PerkCM
//
//  Created by Shailendra vishwakarma on 14/03/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import SwiftUI
import PDFKit

struct BillDetailView: View {
    var body: some View {
            NavigationView {
                VStack{
                    PDFKitView(url: URL(string: "http://www.africau.edu/images/default/sample.pdf")!)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                    ForEach(0..<10) {i in
                            
                            Button(action: {
                                print("Button was tapped \(i)")
                            }) {
                                VStack{
                                Image(systemName: "doc")
                              Text("fdf \(i)")
                                }
                            }
                                .padding()
                                .background(Color.yellow)
                                .cornerRadius(5)
                            .frame(width: 100, height: 100, alignment: .center)
                            
                        }
                    }
                   
                        
                    }
                }
            }.navigationBarTitle(Text("Bills"), displayMode: .inline)
        }
    }


struct BillDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BillDetailView()
    }
}
