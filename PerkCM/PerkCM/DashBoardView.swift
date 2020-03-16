//
//  DashBoardView.swift
//  PerkCM
//
//  Created by Shailendra vishwakarma on 14/03/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import SwiftUI
import PDFKit


struct DashBoardView: View {
    var data = ["Approve Attendance", "View Bills", "View DMR", "Feedback"]

    @State var tag:Bool = false
    
    var body: some View {
        NavigationView{
            
        GeometryReader { geometry in
        
        VStack{
            
            ForEach(0..<self.data.count) {i in
                Divider()
                
                NavigationLink(
                destination: ViewFactory.create(i)){
                               
                            HStack{
                        Image(systemName: "paperplane").resizable()
                        .frame(width: 32.0, height: 32.0)
                    
                        Text(self.data[i]).font(.title)
                            .foregroundColor(Color.black)
                        
                    }
                    .frame(width: 300, height: 50, alignment: .leading)
                
               
                
                } .padding()
                               .background(Color.yellow.opacity(0.9))
                                   .cornerRadius(20)
                
                Divider()
            }
            
            
            
        }
        .frame(width: geometry.size.width - 10, height: geometry.size.height, alignment: .center)
     
        }
   .background(SwiftUI.Color.blue.opacity(0.6).edgesIgnoringSafeArea(.all))
         
    }
    }

}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}


class ViewFactory {
   static func create(_ index: Int) -> AnyView {
    switch index {
    case 0:
        return AnyView(DatePView())
    case 1:
        return AnyView(BillDetailView())
    case 2:
        return AnyView(ContentView())
    case 3:
        return AnyView(FeedbackView())
    default:
        return AnyView(EmptyView())
    }
    }
}
