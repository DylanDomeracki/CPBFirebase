//
//  ContentView.swift
//  CPBFirebase
//
//  Created by Dylan Domeracki on 11/6/23.
//

import SwiftUI
import FirebaseCore
import SwiftData
struct ContentView: View {
    @State private var showingAlert = false
    @State private var Colleges = ""
    @State private var enteredLocation = ""
    @ObservedObject var viewModel = TaskViewModel()
    @State private var enteredCollege = ""
    @State private var enteredStudents = ""
    @State var taskName = ""
    @State private var enteredURL = ""
    @Environment(\.modelContext) var context
    @Query var tasks: [Class4]
    var body: some View {
        HStack{
            Text("Colleges")
            
            Button("+") {
                showingAlert.toggle()
            }
            .alert("Start Building College", isPresented: $showingAlert){
                TextField("Enter College", text: $enteredCollege)
                TextField("Enter Location", text: $enteredLocation)
                TextField("Enter Number of Students", text: $enteredStudents)
                TextField("Enter URL", text: $enteredURL)
                
                Button(action: {
                    let collegeinfo = Class4(college: enteredCollege, location: enteredLocation, numberOfStudents: enteredStudents, URL: enteredURL)
                    let newTask =  Info(college: enteredCollege, location: enteredLocation, numberOfStudents: enteredStudents, URL: enteredURL)
                    viewModel.addTask(currentTask: newTask)
                    taskName = ""
                    context.insert(collegeinfo)
                    enteredCollege = ""
                    enteredLocation = ""
                    enteredLocation = ""
                    enteredURL = ""
                }, label: {
                    Text("Done")
                })            }
        }
        
        
        
        List{
            ForEach(tasks) { currentCollege in
                Text("College Name: \(currentCollege.college)")
                Text("College Location: \(currentCollege.location)")
                Text("Amount of Students: \(currentCollege.numberOfStudents)")
                Text("College URL: \(currentCollege.URL)")
            }
    
        }
    }
}
