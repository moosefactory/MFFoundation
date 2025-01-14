//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software       ©2007-2025 - Moose
//  ------------------------------------------
//  􀈿 JSONCodable.swift
//  􀐚 MFFoundation
//  􀓣 Created by Tristan Leblanc on 22/11/2020.

import Foundation


/// Adopt this protocol to clearly indicates which objects are serializable in JSON
/// in your project, and add one line serializing/deserializing
public protocol JSONCodable: Codable {
    
}

public extension JSONCodable {
    
    /// Deserialize JSON and create the object
    /// - Parameter json: The json data of the encoded object
    /// - Returns: The created object
    static func make(with json: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: json)
    }
    
    
    /// Deserialize JSON, creates the object and pass it to a closure
    ///
    /// - Parameter json: The json data of the encoded object
    /// - Returns: The result of the operation, either the created object or an error
    static func make(with json: Data, closure: (Result<Self,Error>)->Void) {
        do {
            let object = try JSONDecoder().decode(Self.self, from: json)
            closure(Result.success(object))
        }
        catch {
            closure(Result.failure(error))
        }
    }
    
    /// Serialize the object in json format
    /// - Returns: The encoded object data
    func json() throws -> Data  {
        return try JSONEncoder().encode(self)
    }
    
    /// Serialize the object in json format and pass the data to a closure
    ///
    /// - Parameter json: The json data of the encoded object
    /// - Returns: The result of the operation, either the created object or an error
    func json(closure: (Result<Data,Error>)->Void) {
        do {
            let jsonData = try JSONEncoder().encode(self)
            closure(Result.success(jsonData))
        }
        catch {
            closure(Result.failure(error))
        }
    }

}
