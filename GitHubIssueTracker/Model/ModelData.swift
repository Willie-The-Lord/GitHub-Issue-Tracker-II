//
//  ModelData.swift
//  GitHubIssueTracker
//
//  Created by 洪崧傑 on 2023/2/21.
//

import Foundation

struct GitHubIssue: Codable, Identifiable {
    let id = UUID()
    let title: String?
    let createdAt: String
    let body: String?
    let state: String?
    let user: GitHubUser
}

struct GitHubUser: Codable {
    let login: String
    let avatarUrl: String
}

let testData = [GitHubIssue(
    title: "Add dotLottie error handling",
    createdAt: "2023-02-21T14:48:35Z",
    body: "Previously discussed in https://github.com/airbnb/lottie-ios/discussions/1957.\r\n\r\n- Adds proper error propagation to dotLottie loading.\r\n  - Handles manifest loading errors.\r\n  - Handles animation loading errors.\r\n- Adds `LottieLogger` warnings to methods loading from dotLottie.\r\n- Removes unnecessary `animationUrl` property from DotLottieAnimation.\r\n- Unifies asset loading mechanism for dotLottie and standard .json files.\r\n\r\nPropagating errors has actually made the error handling shorter and easier to debug.",
    state: "open",
    user: GitHubUser(login: "mkj-is",
                     avatarUrl: "https://avatars.githubusercontent.com/u/708312?v=4"))]
