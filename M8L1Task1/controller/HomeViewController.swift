//
//  HomeViewController.swift
//  M8L1Task1
//
//  Created by Bekhruz Hakmirzaev on 08/04/23.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    var isLoading = false
    var user = User()
//    var viewModel = UserViewModel()
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var repositoriesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.apiUserSingle(login: "hakmirzaev")
    }
    
    func apiUserSingle(login: String){
        AFHTTp.get(url: AFHTTp.API_USER_SINGLE + String(login), params: AFHTTp.paramsEmpty(), handler: { response in
            self.isLoading = true
            switch response.result {
            case .success:
                let user = try? JSONDecoder().decode(User.self, from: response.data!)
                print(user!)
                self.user = user!
                self.updateUI()
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func updateUI() {
        if self.isLoading {
            loginLabel.text = user.login!
            nameLabel.text = user.name!
            urlLabel.text = user.url!
            typeLabel.text = user.type!
            repositoriesLabel.text = String(user.public_repos!)
            followersLabel.text = String(user.followers!)
            followingLabel.text = String(user.following!)
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
