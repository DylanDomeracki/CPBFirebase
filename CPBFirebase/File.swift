import Foundation
import SwiftData
import SwiftUI

@Model
class Class4{
    var college : String
    var location : String
    var numberOfStudents: String
    var URL: String
   
    init(college: String, location: String, numberOfStudents: String, URL: String) {
        self.college = college
        self.location = location
        self.numberOfStudents = numberOfStudents
        self.URL = URL
    }
        }

struct Info {
    var college : String
    var location : String
    var numberOfStudents: String
    var URL: String
}
