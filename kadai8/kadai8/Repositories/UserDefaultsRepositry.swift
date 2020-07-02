//
//  UserDefaultsRepositry.swift
//  kadai8
//
//  Created by 葛西　佳祐 on 2020/06/24.
//  Copyright © 2020 葛西　佳祐. All rights reserved.
//

import Foundation

class UserDefaultsRepository {
    //UserDefaultsに使うキー
    static let userDefaultsTasksKey = "user_tasks"
    
    static func saveToUserDefaults(_ tasks: [Task]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(tasks)
            UserDefaults.standard.set(data, forKey: userDefaultsTasksKey)
        } catch {
            print(error)
        }
    }
        
    static func loadFromUserDefaults() -> [Task] {
        let decoder = JSONDecoder()
        do {
            guard let data = UserDefaults.standard.data(forKey: userDefaultsTasksKey) else { return [] }
            let tasks = try decoder.decode([Task].self, from: data)
            return tasks
        } catch {
            print(error)
            return []
            }
        }
}

