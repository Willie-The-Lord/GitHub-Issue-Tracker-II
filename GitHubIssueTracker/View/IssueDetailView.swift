//
//  IssueDetailView.swift
//  GitHubIssueTracker
//
//  Created by 洪崧傑 on 2023/2/21.
//

import SwiftUI

struct IssueDetailView: View {
    var state = ""
    var issue: GitHubIssue

    var body: some View {
        // Geometry Reader
        // https://developer.apple.com/documentation/swiftui/geometryreader
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 50) {
                    Text(issue.title ?? "l")
                        .font(.system(.largeTitle, weight: .heavy))
                        .padding(.horizontal, 30)
//                        .padding(.top, 50)
                    
                    HStack (spacing: 20) {
                        // AsyncImage
                        // https://developer.apple.com/documentation/swiftui/asyncimage
                        AsyncImage(
                            url: URL(string: issue.user.avatarUrl),
                            content: { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("User: ")
                                    .font(.system(size: 15, weight: .heavy))
                                Text(issue.user.login)
                                    .font(.system(size: 15))
                            }
                            
                            HStack {
                                Text("Date: ")
                                    .font(.system(size: 15, weight: .heavy))
                                Text((GitHubIssues().formatDate(date: issue.createdAt ) ?? ""))
                                    .font(.system(size: 15))
                            }
                        }
                        .padding(15)
                        // alpha component
                        // https://developer.apple.com/documentation/uikit/uicolor/1621922-withalphacomponent
                        .background(Color(UIColor.systemGray3.withAlphaComponent(0.6)))
                        .cornerRadius(10)
                        
                    }
                    .frame(width: geometry.size.width, height: 150)
                
                    
                    VStack {
                        Text("💻 Description")
                            .font(.system(.title2, weight: .bold))
                        
                        Text(issue.body ?? "")
                            .frame(width: geometry.size.width * 0.7)
                            .padding(15)
                            
                            .background(Color(UIColor.systemGray3.withAlphaComponent(0.6)))
                            .cornerRadius(20)
                    }
                }
            }
            .toolbarBackground(Color(state), for: .navigationBar)
//            .navigationBarHidden(true)
//            .navigationTitle(issue.title ?? "")
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(state), Color.white]),
                startPoint: .topLeading,
                endPoint: .bottomLeading)
        )
    }
}

struct IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IssueDetailView(state: "Open", issue: testData[0])
    }
}
