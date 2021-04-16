//
//  Database.swift
//  coredata+saveimage1
//
//  Created by Shaik abdul mazeed on 16/04/21.
//

import UIKit
import CoreData

class Database: NSObject {

    
    //Creating a singleton instance
    static var shared = Database()
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private override init() {
        super.init()
    }
    
    //Function to store the data in core data
    func insertData(mydata : Data){
        
        let insert = NSEntityDescription.insertNewObject(forEntityName: "Teacher", into: context) as! Teacher
        insert.myimage = mydata
        do{
            
            try context.save()
        }catch{
            print("error occured in saving the data")
        }
        
    }
    //function to get the image from the coredata
    func getImage() -> [Teacher]{
        
        var teacher = [Teacher]()
        var fetchImage = NSFetchRequest<NSFetchRequestResult>(entityName: "Teacher")
        do{
            teacher = try context.fetch(fetchImage) as! [Teacher]
            
        }catch{
            print("error in fetching the data")
        }
        return teacher
    }
}

