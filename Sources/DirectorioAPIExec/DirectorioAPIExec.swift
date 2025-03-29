//
//  DirectorioAPIExec.swift
//  DirectorioAPI
//
//  Created by Pablo González de la Parra on 26/03/25.
//

import Foundation
import DirectorioAPI


@main
struct DirectorioAPIExec {
    
    static let directorioAPI = DirectorioAPI()
    
    static func main() async {
        do {
            let businesses = try await directorioAPI.getBusinesses()
            print(businesses)
            
            let search = try await directorioAPI.searchBusinessesByTitle(title: "Los Pastssores")
            print(search)
        } catch {
            print(error.localizedDescription)
        }
    }
}
