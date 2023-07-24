//
//  ViewController.swift
//  NetworkerSample
//
//  Created by Sajith Konara on 24/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func getUsersButtonOnTapped(_ sender: Any) {
        Task { @MainActor in
            if let users = await getUsers(){
                print("Returned \(users.count) users from the API")
            }else{
                print("Users returned as nil")
            }
        }
    }
    
    func getUsers() async -> Users?{
        let networkLayer = NetworkLayer.shared
        do{
            let users = try await networkLayer.getResponse(for: NetworkRouter.getUsers, for: Users.self)
            return users
        }catch (let e){
            print(e.localizedDescription)
            return nil
        }
    }
}

