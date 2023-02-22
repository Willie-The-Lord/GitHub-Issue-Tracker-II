//
//  ContentView.swift
//  GitHubIssueTracker
//
//  Created by 洪崧傑 on 2023/2/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var GitHubissues: GitHubIssues
    
    var body: some View {
        TabView {
            IssueTabView(state: "Open", issues: GitHubissues.openIssues)
                .tabItem {
                    Label("Open", systemImage: "envelope.open")
                }
            IssueTabView(state: "Closed", issues: GitHubissues.closedIssues)
                .tabItem {
                    Label("Closed", systemImage: "envelope")
                }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(GitHubissues: GitHubIssues())
    }
}
