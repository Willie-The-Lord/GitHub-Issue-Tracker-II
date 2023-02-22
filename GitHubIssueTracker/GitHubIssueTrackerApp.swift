//
//  GitHubIssueTrackerApp.swift
//  GitHubIssueTracker
//
//  Created by 洪崧傑 on 2023/2/21.
//

import SwiftUI

@main
struct GitHubIssueTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(GitHubissues: GitHubIssues())
        }
    }
}
