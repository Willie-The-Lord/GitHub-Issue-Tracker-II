//
//  GitHubClient.swift
//  GitHubIssueTracker
//
//  Created by 洪崧傑 on 2023/2/21.
//

import Foundation

class GitHubIssues: ObservableObject {
    
    @Published var openIssues: [GitHubIssue] = []
    @Published var closedIssues: [GitHubIssue] = []
    
    init() {
        let baseURL = URL(string: "https://api.github.com/repos/airbnb/lottie-ios/issues?state=all")!
        
        let task = URLSession.shared.dataTask(with: baseURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let issues = try? decoder.decode([GitHubIssue].self, from: data)
            
            DispatchQueue.main.async {
                if let issues = issues {
                    self.openIssues = issues.filter({ $0.state == "open" })
                    self.closedIssues = issues.filter({ $0.state == "closed" })
                }
            }
        }
        task.resume()
    }
    
    func formatDate(date: String) -> String? {
        let dateGet = DateFormatter()
        dateGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let datePost = DateFormatter()
        datePost.dateFormat = "MMM dd,yyyy"
        
        if let newDate = dateGet.date(from: date) {
            return datePost.string(from: newDate)
        } else { return nil }
    }
}


