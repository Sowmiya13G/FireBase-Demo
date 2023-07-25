//
//  SignUpViewController.swift
//  FireBase Demo
//
//  Created by DB-MM-002 on 19/07/23.
//


import UIKit
import FirebaseFirestore
import DropDown

class SignInViewController: UIViewController {
//MARK: -Variable Declaration
    
    let dropDownForGenderOption = DropDown()
    let dropDownForLanguageOption = DropDown()
  
//MARK: -IB Declarations
    
    @IBOutlet weak var txtFieldForName: UITextField!
    @IBOutlet weak var txtFieldForGender: UITextField!
    @IBOutlet weak var txtFieldForLanguage: UITextField!
    @IBOutlet weak var txtFieldForEmail: UITextField!
    @IBOutlet weak var txtFieldForPassword: UITextField!
    @IBOutlet weak var btnForGenderOption: UIButton!
    @IBOutlet weak var btnForLanguageOption: UIButton!
    
    @IBAction func btnToskip(_ sender: Any) {
        let nxtVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserListViewController" ) as? UserListViewController
        self.navigationController?.pushViewController(nxtVC!, animated: true)
    }
    @IBAction func btnForGenderOption(_ sender: UIButton) {
        dropDownForGenderOption.anchorView = txtFieldForGender
        dropDownForGenderOption.show()
    }
    @IBAction func btnForLanguageOption(_ sender: UIButton) {
        dropDownForLanguageOption.anchorView = txtFieldForLanguage
        dropDownForLanguageOption.show()
    }
    @IBAction func btnForSubmit(_ sender: UIButton) {
        buttonTapped()
        let nxtVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserListViewController" ) as? UserListViewController
        self.navigationController?.pushViewController(nxtVC!, animated: true)
        
    }
//MARK: -LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
//MARK: - setUI Method
    func setUI(){
            self.navigationController?.isNavigationBarHidden = false
            // Setup For Gender Option
            dropDownForGenderOption.dataSource = ["Male", "Female"]
            dropDownForGenderOption.selectionAction = { [unowned self] (index: Int, item: String) in
                btnForGenderOption.setTitle(item, for: .normal)
                txtFieldForGender.text = item
                dropDownForGenderOption.bottomOffset = CGPoint(x: 0, y: txtFieldForGender.bounds.height)
            }
            // Setup For Language Option
            dropDownForLanguageOption.dataSource = ["English", "Tamil", "Hindi"]
            dropDownForLanguageOption.selectionAction = { [unowned self] (index: Int, item: String) in
                btnForLanguageOption.setTitle(item, for: .normal)
                txtFieldForLanguage.text = item
                dropDownForLanguageOption.bottomOffset = CGPoint(x: 0, y: txtFieldForLanguage.bounds.height)
            }
    }
//MARK: - uploadToFireBase Method
    func uploadUserDetails(name: String,gender: String, language: String, email: String, password: String ) {
        var ref: DocumentReference? = nil
        ref = db.collection("User Details").addDocument(data: [
            "name": name,
            "gender": gender,
            "language": language,
            "email": email,
            "password": password
            
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    func buttonTapped(){
        guard let name = txtFieldForName.text,
              let gender = txtFieldForGender.text,
              let language = txtFieldForLanguage.text,
              let email = txtFieldForEmail.text,
              let password = txtFieldForPassword.text else {
            return
        }
        uploadUserDetails(name: name, gender: gender, language: language, email: email, password: password)
    }
}
