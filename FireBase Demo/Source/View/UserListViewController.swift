//
//  UserListViewController.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 19/07/23.
//

import UIKit
import FirebaseFirestore
class UserListViewController: UIViewController {
    var users = [User]()
    var selectedUser : User?
    //MARK: -IB Declarations
    @IBOutlet weak var tblViewForUserList: UITableView!
    //MARK: -LifeCycle Methods
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        fetchData()
    }
    //MARK: - setUI Method
    func setUI()  {
              self.tblViewForUserList.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier:  "UserListTableViewCell")

              self.tblViewForUserList.delegate = self
              self.tblViewForUserList.dataSource = self
    }
    //MARK: - uploadToFireBase Method
    func fetchData(){
        db.collection("User Details").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.users = snapshot.documents.map{ key in
                            return User(id: key.documentID, name: key["name"] as? String ?? "",
                                        gender:  key["gender"] as? String ?? "",
                                        language: key["language"] as? String ?? "",
                                        email: key["email"] as? String ?? "",
                                        password:  key["password"] as? String ?? "",
                                        documentID: key["documentID"] as? String ?? "") }
                        self.tblViewForUserList.reloadData() }
                    }
                }
            else {
                print("Error retrieving documents: \(error?.localizedDescription)")
            }
        }
        
    }
    
    func deleteDocument(at indexPath: IndexPath) {
        let user = users[indexPath.row]
        let db = Firestore.firestore()
        let docRef = db.collection("User Details").document(user.id)
        
        docRef.delete { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed from Firestore!")
                DispatchQueue.main.async {
                    self.users.remove(at: indexPath.row)
                    self.tblViewForUserList.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
}
// MARK: - Delegate Methods
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("COUNT OF USERS...\(users.count)")
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as! UserListTableViewCell
        let user = users[indexPath.row].name
        cell.lblForUserName.text = user
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = users[indexPath.row]
        print("SELECTED ITEM..\(selectedUser)")
        let userDetailsVC = storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        userDetailsVC.selectedUser = selectedUser
        navigationController?.pushViewController(userDetailsVC, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.deleteDocument(at: indexPath)
            completion(true)
        }
    
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .white
    
        return UISwipeActionsConfiguration(actions: [deleteAction])
    
    }
}
