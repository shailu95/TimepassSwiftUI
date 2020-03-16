//
//  DatePView.swift
//  PerkCM
//
//  Created by Shailendra vishwakarma on 16/03/20.
//  Copyright © 2020 Shailendra vishwakarma. All rights reserved.
//

import SwiftUI

class ModelD {
    var data1 = ["1", "2", "3"]
       var data2 = ["1","2"]
       
       var MainData = [String]()
    
   public func transfer(){
       MainData = data2
    }

}

struct emp: Identifiable {
    var id = UUID()
    var name: String
}

struct DatePView: View {
    @ObservedObject var dateModelController = DateModelController()
    @State private var selectorIndex = 0
    @State private var items = ["Absent","Present"]
    
    @State var showSelectAllBtn = false
    
    @State private var showingAlert = false
    
    @State private var selectAll = true
    
    @State var model = ModelD()
    
    var isSelected: Bool = false
    
      @State var Employees: [String] = ["Apples",
    "Oranges", "Bananas", "Pears", "Mangos",
    "Grapefruit"]
      @State var selections: [String] = []
    
    var alert: Alert {
        Alert(title: Text("Approve All"), message: Text("This will mark all the employees present"), primaryButton: .default(Text("Dismiss")), secondaryButton: .default(Text("OK"), action: {
//            self.selectAll.toggle()
            self.selections = self.Employees
        }))
    }
    
    var body: some View {
        
        VStack() {
            
            Text("Please choose a date.").font(.title).bold()
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing: 10) {
                    ForEach(dateModelController.listOfValidDates, id: \.self) { date in
                        GridView(date: date).onTapGesture { //Date change
                            self.Employees.removeLast(2)
               self.dateModelController.toggleIsSelected(date: date)
                        }
                    }
                }
            })
            HStack {
                Text("Your selected date is: ")
                Text("\(self.dateModelController.selectedDate)").foregroundColor(.red).bold()
            }.padding(.top, 20)
            
            Picker("Mode", selection: $selectorIndex) { //Segment
                ForEach(0 ..< items.count) { index in
                    Text(self.items[index]).tag(index)
                    
                }
            }.pickerStyle(SegmentedPickerStyle())
            .background(Color.orange)
            
            if selectorIndex == 1{
                
            Button(action: {
                self.showingAlert.toggle()
            }){
                HStack {
                    if self.selectAll{
                    Image(systemName: "checkmark.square.fill")
                        .font(.title)
                    }
                    else{
                        Image(systemName: "square")
                        .font(.title)
                    }
                    
                    Text("Select All")
                        .fontWeight(.regular)
                        .font(.system(size: 20))
                    
                }
                .padding(.leading, 200)
            }.alert(isPresented: $showingAlert, content: { self.alert })
            }
            
            if selectorIndex == 1{
            List(0..<Employees.count) { item in
                
                Button(action: {
//                    print(item)
                    if self.selections.contains(self.Employees[item]) {
                        self.selections.removeAll(where: { $0 == self.Employees[item] })
                    }
                    else {
                        self.selections.append(self.Employees[item])
                    }
                }){
                    HStack {
                        Text("º")
                            .frame(width: 10, height: 10, alignment: .leading)
                        
                        Text("Employee Name \(self.Employees[item])")
                            .font(.body)
                        Spacer()
                        
                        if self.selections.contains(self.Employees[item]) {
                            Image(systemName: "checkmark.square.fill")
                                .frame(width: 50, height: 10, alignment: .leading)
                        }
                        else{
                            Image(systemName: "square")
                                .frame(width: 50, height: 10, alignment: .leading)
                        }
                    }.font(.title)
                }

                  }
            }
            else{
                List(0..<Employees.count) { item in
                    
                     Text("Employee Name \(self.Employees[item])")
                }
            }
            
        }.padding(.top, -50)
        
        
    }
}

struct DatePView_Previews: PreviewProvider {
    static var previews: some View {
        DatePView()
    }
}

