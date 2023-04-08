import Foundation

struct User: Decodable {
    var login: String?
    var url: String?
    var type: String?
    var public_repos: Int?
    var followers: Int?
    var following: Int?
    var name: String?
    var email: String?
    
    init() {
        self.login = ""
        self.name = ""
        self.email = ""
        self.url = ""
        self.type = ""
        self.public_repos = 0
        self.followers = 0
        self.following = 0
    }
    
    init(login: String, url: String, type: String, public_repos: Int, followers: Int, following: Int, name: String, email: String) {
        self.login = login
        self.name = name
        self.email = email
        self.url = url
        self.type = type
        self.public_repos = public_repos
        self.followers = followers
        self.following = following
    }
}
