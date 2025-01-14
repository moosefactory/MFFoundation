import Testing
@testable import MFFoundation

import Foundation

@Test func JSONCodable() async throws {
    
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    
    let date = Date(timeIntervalSince1970: 0)
    
    struct Animal: JSONCodable, Equatable {
        let name: String
        let numberOfLegs: Int
        let dateOfBirth: Date
    }
    
    let mouse = Animal(name: "Mouse", numberOfLegs: 4, dateOfBirth: date)
    
    #expect(mouse.name == "Mouse" && mouse.numberOfLegs == 4 && mouse.dateOfBirth == date)
    
    print(try mouse.json())
    
    Animal(name: "Mouse", numberOfLegs: 4, dateOfBirth: date).json { result in
        var testResult: Animal?
        switch result {
        case .failure(let err):
            print(err)
        case .success(let data):
            testResult = try! Animal.make(with: data)
        }
        
        #expect(testResult == mouse)
    }
}
