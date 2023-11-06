import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
class TaskViewModel: ObservableObject {
    @Published var tasks : [Info] = []
    init() {
        PullFromFirebase()
    }
    
    func addTask(currentTask: Info) {
        tasks.append(currentTask)
        AddToFirebase(task: currentTask)
    }
    
    func AddToFirebase(task: Info) {
        let database = Database.database().reference()
        database.child("College Information").child(task.college).child(task.location).child(task.numberOfStudents).child(task.URL)
    }
    
    func PullFromFirebase() {
        let databaseRef = Database.database().reference().child("Tasks")
        databaseRef.getData { myError, myDataSnapshot in
            var newList: [Info] = []
            for task in myDataSnapshot?.children.allObjects as! [DataSnapshot] {
                let nameOfCollege = task.key
                let locationCollege = task.key
                let numberOfStudents2 = task.key
                let CollegeURL = task.key
                let dictionary = task.value as! [String:Bool]
                guard let completed = dictionary["Completed"] else { return }
                let currentTask = Info(college: nameOfCollege, location: locationCollege, numberOfStudents: numberOfStudents2, URL: CollegeURL)
                newList.append(currentTask)
            }
            self.tasks = newList
            
        }
        
    }
}
