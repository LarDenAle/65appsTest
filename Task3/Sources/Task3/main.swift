//
//  File.swift
//  
//
//  Created by Denis Larin on 05.02.2021.
//

import Foundation
import Alamofire

print("Enter github nickname: ")

guard let nickname = readLine()?.trimmingCharacters(in: CharacterSet.urlPathAllowed.inverted),
    !nickname.isEmpty else {
    throw NSError()
}
let url = URL(string: "https://api.github.com/users/\(nickname)/repos")!

Alamofire.request(url)
    .validate()
    .responseJSON(queue: DispatchQueue.global(qos: .background), options: .allowFragments) { response in
        guard let data = response.data,
            let repositories = try? JSONDecoder().decode([Repositories].self, from: data) else {
                print("Error")
           return
        }
        print("\(nickname) repositories: \(repositories)")
}

while(true) {}
