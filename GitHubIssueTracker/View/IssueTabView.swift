//
//  IssueTabView.swift
//  GitHubIssueTracker
//
//  Created by 洪崧傑 on 2023/2/21.
//

import SwiftUI

struct IssueTabView: View {
    
    var state = ""
    var issues: [GitHubIssue]
    
    var body: some View {
        NavigationView {
            List(issues) { issue in
                NavigationLink {
                    IssueDetailView(state: state, issue: issue)
                } label: {
                    HStack {
                        let img = state + String(1)
                        
                        Image(img)

                        
                        VStack(alignment: .leading) {
                            Text(issue.title ?? "")
                                .fontWeight(.bold)
                                .lineLimit(2)
                            Text("@" + issue.user.login)
                        }
                        .padding()
                        
                    }
                    
                }
            }
            .navigationBarTitle(state + " Issues")
        }
        .toolbarBackground(Color.pink, for: .navigationBar)
    }
}

struct IssueTabView_Previews: PreviewProvider {
    static var previews: some View {
        IssueTabView(state: "Open", issues: testData)
    }
}
