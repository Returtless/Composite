//
//  Chain.swift
//  Composite
//
//  Created by Владислав Лихачев on 12.08.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

class FilesData {
    static func data(from file: String) -> Data {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        let data = try! Data(contentsOf: url)
        return data
    }
}

struct Person : Codable {
    var name : String
    var age : Int
    var isDeveloper : Bool
}

protocol JsonDecoderHandler {
    
    var next: JsonDecoderHandler? { get set }
    
    func handleData(_ data: Data) -> [Person]?
}




class FirstJsonDecoderHandler: JsonDecoderHandler {
    var next: JsonDecoderHandler?
    
    func handleData(_ data: Data) -> [Person]? {
        var array: [Person]?
        do {
            let res = try JSONDecoder().decode(DataStruct.self, from: data)
            array = res.data
        } catch {
            array = self.next?.handleData(data)
        }
        if array == nil {
            array = self.next?.handleData(data)
        }
        return array
    }
    
    struct DataStruct: Codable {
        var data: [Person]
    }
}

class SecondJsonDecoderHandler: JsonDecoderHandler {
    var next: JsonDecoderHandler?
    
    func handleData(_ data: Data) -> [Person]? {
        var array: [Person]?
        do {
            let res = try JSONDecoder().decode(ResultStruct.self, from: data)
            array = res.result
        } catch {
            array = self.next?.handleData(data)
        }
        if array == nil {
            array = self.next?.handleData(data)
        }
        return array
    }
    
    struct ResultStruct: Codable {
        var result: [Person]
    }
}

class ThirdJsonDecoderHandler: JsonDecoderHandler {
    var next: JsonDecoderHandler?
    
    func handleData(_ data: Data) -> [Person]? {
        var array: [Person]?
        do {
            array = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            array = self.next?.handleData(data)
        }
        if array == nil {
            array = self.next?.handleData(data)
        }
        return array
    }
    
    struct ResultStruct: Codable {
        var result: [Person]
    }
}


