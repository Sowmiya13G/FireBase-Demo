//
//  UserDetailsViewController.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 19/07/23.
//

import UIKit
import DropDown
import Firebase
import FirebaseFirestore

class UserDetailsViewController: UIViewController {
    
//MARK: - Variable Declaration
    
    var users = [User]()
    var userModel = [User]()
    var selectedUser : User?
    var selectedItem = 0
    let dropDownForGenderOption = DropDown()
    let dropDownForLanguageOption = DropDown()
 
    @IBOutlet weak var txtFieldForName: UITextField!
    @IBOutlet weak var txtFieldForGender: UITextField!
    @IBOutlet weak var txtFieldForLanguage: UITextField!
    @IBOutlet weak var txtFieldForEmail: UITextField!
    @IBOutlet weak var txtFieldForPassword: UITextField!
    @IBOutlet weak var btnForGenderOption: UIButton!
    @IBOutlet weak var btnForLanguageOption: UIButton!
    
    @IBAction func btnForGenderOption(_ sender: UIButton) {
        dropDownForGenderOption.anchorView = txtFieldForGender
        dropDownForGenderOption.show()
    }
    @IBAction func btnForLanguageOption(_ sender: UIButton) {
        dropDownForLanguageOption.anchorView = txtFieldForLanguage
        dropDownForLanguageOption.show()
    }
    @IBAction func btnToUpdate(_ sender: UIButton) {
        updateToFirebase()
        showToast(message: "User Details Updated Successfully")
    }
    
    @IBAction func btnToBack(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignInViewController" ) as? SignInViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setUI()      
    }
    
func setUI(){
 	   let user = selectedUser
        txtFieldForName.text = user?.name
        txtFieldForGender.text = user?.gender
        txtFieldForLanguage.text = user?.language
        txtFieldForEmail.text = user?.email
        txtFieldForPassword.text = user?.password
        print("SELECTED USER..\(user)")
        self.navigationController?.isNavigationBarHidden = false
                
        // Setup For Gender Option
                dropDownForGenderOption.dataSource = ["Male", "Female"]
                dropDownForGenderOption.selectionAction = { [unowned self] (index: Int, item: String) in
                    btnForGenderOption.setTitle(item, for: .normal)
                    txtFieldForGender.text = item
                    dropDownForGenderOption.bottomOffset = CGPoint(x: 0, y: txtFieldForGender.bounds.height) }
      // Setup For Language Option
                dropDownForLanguageOption.dataSource = ["English", "Tamil", "Hindi"]
                dropDownForLanguageOption.selectionAction = { [unowned self] (index: Int, item: String) in
                    btnForLanguageOption.setTitle(item, for: .normal)
                    txtFieldForLanguage.text = item
                    dropDownForLanguageOption.bottomOffset = CGPoint(x: 0, y: txtFieldForLanguage.bounds.height) }
    }
    func fetchData() {
        db.collection("User Details").getDocuments { [unowned self] snapshot, error in
            if let error = error {
                print("Error retrieving documents: \(error.localizedDescription)")
                return
            }
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.users = snapshot.documents.compactMap { document in
                        let data = document.data()
                        let id = document.documentID
                        let name = data["name"] as? String ?? ""
                        let gender = data["gender"] as? String ?? ""
                        let language = data["language"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        let password = data["password"] as? String ?? ""
                        
                        return User(id: id, name: name, gender: gender, language: language, email: email, password: password, documentID: id) }
                    print("DETAILS OF USERS...\(self.users)") }
            }
        }
    }
    func updateToFirebase() {
        guard let user = selectedUser else {
            print("No User Selected")
            return
        }
        let db = Firestore.firestore()
        let docRef = db.collection("User Details").document(user.id)
        
        guard let name = txtFieldForName.text,
              let gender = txtFieldForGender.text,
              let language = txtFieldForLanguage.text,
              let email = txtFieldForEmail.text,
              let password = txtFieldForPassword.text else {
            return
        }
        
        docRef.updateData(["name": name, "gender": gender, "language": language, "email": email, "password": password]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully updated!")
            }
        }
    }

    

    func showToast(message: String) {
        let toastController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        self.present(toastController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            toastController.dismiss(animated: true, completion: nil) }
    }
}

