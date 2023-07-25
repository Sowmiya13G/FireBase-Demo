//    let db = Firestore.firestore()
//    let usersCollection = db.collection("User Details") // Replace "User Details" with your actual collection name
//    let documentID = "9H9ClKRTfOXNldFAchkh"
//    let docRef = usersCollection.document(documentID)
//    docRef.getDocument(source: .cache) { (document, error) in
//        if let error = error {
//            print("Error fetching user names: \(error.localizedDescription)")
//            return
//        }
//        guard let document = document, document.exists else {
//            print("Document does not exist.")
//            return
//        }
//        if let name = document.data()?["name"] as? String {
//            let user = User(name: name)
//            users = [user]
//            self.tblViewForUserList.reloadData()
//        } else {
//            print("User name not found in document.")
//        }
//    }
//}
//func fetchUserNames() {
//    let db = Firestore.firestore()
//    let docRef = db.collection("User Details").document().documentID
//    db.collection("User Details").getDocuments { [weak self] (querySnapshot, error) in
//    if let error = error {
//                    print("Error fetching user names: \(error.localizedDescription)")
//                    return
//                }
//                guard let documents = querySnapshot?.documents else {
//                    print("No user names found.")
//                    return
//                }
//                self?.users = documents.compactMap { document in
//                    let userData = document.data()
//                    return userData["name"] as? User
//                }
//            self!.tblViewForUserList.reloadData()
//            }
//}
//
//    
//    
//    import Firebase
//
//    // Define a struct to represent the user data
//    struct User {
//        let name: String
//        // Add more properties if needed
//    }
//
//    // Create an array to store the fetched user names
//    var users: [User] = []
//
//    // Fetch user names from Firestore and update the table view
//    func fetchUserNames() {
//        let db = Firestore.firestore()
//        let usersCollection = db.collection("User Details") // Replace "User Details" with your actual collection name
//        let documentID = "9H9ClKRTfOXNldFAchkh" // Replace this with the specific document ID you want to fetch
//
//        let docRef = usersCollection.document(documentID)
//        docRef.getDocument(source: .cache) { (document, error) in
//            if let error = error {
//                print("Error fetching user names: \(error.localizedDescription)")
//                return
//            }
//
//            guard let document = document, document.exists else {
//                print("Document does not exist.")
//                return
//            }
//
//            if let name = document.data()?["name"] as? String {
//                let user = User(from: name as! Decoder)
//                users = [user] // If you only want to fetch one user, replace the existing users array with a new array containing only this user.
//                self.tblViewForUserList.reloadData()
//            } else {
//                print("User name not found in document.")
//            }
//        }
//    }
//

//
//import Firebase
//
//// Define a struct to represent the user data
//struct User {
//    let name: String
//    // Add more properties if needed
//}
//
//// Create an array to store the fetched user names
//var users: [User] = []
//
//// Fetch user names from Firestore and update the table view
//func fetchUserNames() {
//    let db = Firestore.firestore()
//    let usersCollection = db.collection("User Details")
//    let documentID = "9H9ClKRTfOXNldFAchkh" // Replace this with the specific document ID you want to fetch
//
//    let docRef = usersCollection.document(documentID)
//    docRef.getDocument { (document, error) in
//        if let error = error {
//            print("Error fetching user names: \(error.localizedDescription)")
//            return
//        }
//
//        guard let document = document, document.exists else {
//            print("Document does not exist.")
//            return
//        }
//
//        if let name = document.data()?["name"] as? String {
//            let user = User(name: name)
//            self.users = [user]
//            self.tblViewForUserList.reloadData()
//        } else {
//            print("User name not found in document.")
//        }
//    }
//}




//{
//    let db = Firestore.firestore()
//    let usersCollection = db.collection("User Details")
//    let documentId =  usersCollection.document().documentID
//    var docRef = usersCollection.document(documentId)
//    docRef.getDocument { (document, error) in
//        if let error = error {
//            print("Error fetching user names: \(error.localizedDescription)")
//            return
//        }
//
//        guard let document = document, document.exists else {
//            print("Document does not exist.")
//            return
//        }
//        if let name = document.data()?["name"] as? String {
////                let user = User(from: <#Decoder#>)
//
//            self.tblViewForUserList.reloadData()
//        }
//
//    }
//
//}

//    func fetchUsers() {
//        let db = Firestore.firestore()
//        db.collection("User Details").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//            if let snapshot = querySnapshot {
//                    DispatchQueue.main.async {
//                        self.users = snapshot.documents.map { key in
//                            return User(name: key["name"] as? String ?? "",
//                                        gender:  key["gender"] as? String ?? "",
//                                        language: key["language"] as? String ?? "",
//                                        email: key["email"] as? String ?? "",
//                                        password:  key["password"] as? String ?? "",
//                                        documentID: key["documentID"] as? String ?? "") }
//                        }
////                    print("\(document.documentID) => \(document.data())")
//                        self.tblViewForUserList.reloadData()
//                }
//                }
//            }
//        }
//    }
//    func fetchUserNames() {
//            let db = Firestore.firestore()
//           // let usersCollection = db.collection("User Details")
////            let documentId =  usersCollection.document().documentID
////            var docRef = usersCollection.document()
//        db.collection("UserDetails").getDocuments { snapshotQuery, error in
//            if error == nil{
//                if let snapshot = snapshotQuery {
//                    DispatchQueue.main.async {
//                        self.users = snapshot.documents.map{ key in
//                            return User(name: key["name"] as? String ?? "",
//                                        gender:  key["gender"] as? String ?? "",
//                                        language: key["language"] as? String ?? "",
//                                        email: key["email"] as? String ?? "",
//                                        password:  key["password"] as? String ?? "",
//                                        documentID: key["documentID"] as? String ?? "") }
//                        }
//
//                    }
//                }
//            else {
//                print("Error retrieving documents: \(error?.localizedDescription)")
//            }
//                print("Data....\(self.users)")
//        }
//        self.tblViewForUserList.reloadData()
//    }
//    func fetchUsers() {
//        let db = Firestore.firestore()
//        db.collection("User Details").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//
//                    print("\(document.documentID) => \(document.data())")
//                    let userDetails = document.data()
//
//                    print("Datasss...\(userDetails)")
//                }
//            }
//        }
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        startListeningForUsers()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        stopListeningForUsers()
//    }
//
//    func startListeningForUsers() {
//        let db = Firestore.firestore()
//
//        let usersListener = db.collection("users").addSnapshotListener { [weak self] (querySnapshot, error) in
//            if let error = error {
//                print("Error listening for users: \(error.localizedDescription)")
//                return
//            }
//
//            guard let documents = querySnapshot?.documents else {
//                print("No documents found.")
//                return
//            }
//
//            self?.users = documents.compactMap { document in
//                let result = Result { try document.data(as: User.self) }
//                switch result {
//                case .success(let user):
//                    return user
//                case .failure(let error):
//                    print("Error decoding user: \(error)")
//                    return nil
//                }
//            }
//
//            self?.tblViewForUserList.reloadData()
//        }
//    }
//
//    func stopListeningForUsers() {
//        usersListener?.remove()
//        usersListener = nil
//    }
//    guard let name = nameTxtField.text,
//                  let age = AgeTxtField.text,
//                  let mobileNo = MobileNoTxtField.text,
//                  let mailId = emailIdTxtField.text,
//                  let gender = genderLbl.text,
//                  let language = languagelbl.text else {
//                return
//            }
    
//        let db = Firestore.firestore()
//
//        db.collection("User Details").getDocuments { [weak self] (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching users: \(error.localizedDescription)")
//                return
//            }
//            guard let documents = querySnapshot?.documents else {
//                print("No documents found.")
//                return
//            }
//            self?.users = documents.compactMap { document in
//                let result = Result { try document.data(as: User.self) }
//                switch result {
//                case .success(let user):
//                    return user
//                case .failure(let error):
//                    print("Error decoding user: \(error)")
//                    return nil
//                }
//            }
//
//            self?.tblViewForUserList.reloadData()
//        }

//let db = Firestore.firestore()
//let query = db.collection("User Details").getDocuments { (querySnapshot, error) in
//    if let error = error {
//        print("Error fetching user details: \(error.localizedDescription)")
//        return
//    }
//
//    guard let documents = querySnapshot?.documents else {
//        print("No user details found.")
//        return
//    }
//    if let userDocument = documents.first {
//
//        let userData = userDocument.data()
//        let name = userData["name"] as? String ?? ""
//        let email = userData["email"] as? String ?? ""
//        let password = userData["password"] as? String ?? ""
//        let phoneNumber = userData["phoneNumber"] as? String ?? ""
//        let gender = userData["gender"] as? String ?? ""
//        let language = userData["language"] as? String ?? ""
//        print("User Details - Name: \(name), Email: \(email), Password: \(password), Phone Number: \(phoneNumber), Gender: \(gender), Language: \(language)")
//    }
//    self.tblViewForUserList.reloadData()
//}

//        db.collection("User Details").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
      
//
//        db.collection("User Details").getDocuments { [weak self] (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching user names: \(error.localizedDescription)")
//                return
//            }
//            guard let documents = querySnapshot?.documents else {
//                print("No user names found.")
//                return
//            }
//            self?.users = documents.compactMap { document in
//                let userData = document.data()
//                return userData["name"] as? User
//            }
//            self?.tblViewForUserList.reloadData()
//        }
////    }
//func updateDateToFirebase(){
//
//    guard let name = nameTxtField.text,
//          let age = ageTxtField.text,
//          let mobileNo = mobileNoTxtField.text,
//          let mailId = emailIdTxtField.text,
//          let gender = genderLbl.text,
//          let language = languagelbl.text else {
//        return
//    }
//
//    let docId = ref.collection("UserDetails").document().documentID
//    ref.collection("UserDetails").document(docId).updateData(["Name": name, "Age": age, "Mobile Number": mobileNo, "Email Address": mailId, "Gender": gender, "Language": language]){ error in
//        if let error = error {
//            print("Error writing document: \(error)")
//        } else {
//            DispatchQueue.main.async {
//                self.getData()
//            }
//            print("Document successfully updated!")
//        }
//    }
//}

//
//docRef.getDocument(source: .cache) { (document, error) in
//  if let document = document {
//    let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//    print("Cached document data: \(dataDescription)")
//  } else {
//    print("Document does not exist in cache")
//  }
//}
//self.tblViewForUserList.reloadData()
//}


//        let db = Firestore.firestore()
//        guard let userData = try? FirestoreEncoder().encode(user) else {
//            return
//        }
//        let usersCollection = db.collection("users")
//        usersCollection.addDocument(data: userData) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added successfully")
//            }
//        }





//
//func fetchUsers() {
//    let db = Firestore.firestore()
//    db.collection("User Details").getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//        } else {
//            for document in querySnapshot!.documents {
//                
//                print("\(document.documentID) => \(document.data())")
//                let userDetails = document.data()
//                print("Datasss...\(userDetails)")
//            }
//        }
//    }
//}
//
//    func configureUserDetails() {
//        guard let user = selectedUser else { return }
//
//        userDetailLabels = [
//            "Name: \(user.name)",
//            "Gender: \(user.gender)",
//            "Language: \(user.language)",
//            "Email: \(user.email)",
//            "Password: \(user.password)"
//        ]
//    }


//    func fetchData(){
//            let ref = Firestore.firestore()
//            ref.collection("User Details").getDocuments { snapshot, error in
//                if error == nil{
//                    if let snapshot = snapshot {
//                        DispatchQueue.main.async {
//                            self.users = snapshot.documents.map{ key in
//                                return User(id: key.documentID, name: key["name"] as? String ?? "",
//                                            gender:  key["gender"] as? String ?? "",
//                                            language: key["language"] as? String ?? "",
//                                           email: key["email"] as? String ?? "",
//                                          password:  key["password"] as? String ?? "",
//                                           documentID: key["documentID"] as? String ?? "") }
//                            print("Data....\(self.users)") }
//                        }
//                    } else {
//                        print("Error retrieving documents: \(String(describing: error?.localizedDescription))")
//                }

//        }
//    func buttonTapped(){
//        guard let name = lblForName.text,
//              let gender = lblForGender.text,
//              let language = lblForLanguage.text,
//              let email = lblForEmail.text,
//              let password = lblForPassword.text else {
//            return
//        }
//        updateUserDetails(name: name, gender: gender, language: language, email: email, password: password)
//    }
//    func updateFirestoreUserProfile(uid: String, data: [String:Any]) {
//        Firestore.firestore().collection("users").document(uid).updateData(data) { err in
//            if let err = err {
//                print("Error updating document: \(err) ")
//            }
//            else {
//                print("Document successfully updated")
//            }
//        }
//    }
    
//    func updateUserDetails(name: String,gender: String, language: String, email: String, password: String ) {
//        let db = Firestore.firestore()
//        var ref: DocumentReference? = nil
//        ref = db.collection("User Details").addDocument(data: [
//            "name": name,
//            "gender": gender,
//            "language": language,
//            "email": email,
//            "password": password
//
//        ]) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document added with ID: \(ref!.documentID)")
//            }
//        }
//    }
    


    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")   { (action, view, completion) in
//                    self.deleteItem(at: indexPath)
//                      tableView.deleteRows(at: [indexPath], with: .fade)
//            completion(true)
//                }
//        if editingStyle == .delete {
//            let user = users[indexPath.row]
//            let db = Firestore.firestore()
//            db.collection("User Details").document(user.documentID).delete { (error) in
//                if let error = error {
//                    print("Error deleting user: \(error)")
//                } else {
//                    self.users.remove(at: indexPath.row)
//                    self.tblViewForUserList.deleteRows(at: [indexPath], with: .fade)
//                    self.deleteItem(at: indexPath)
//                }
//            }
//        }
//        self.tblViewForUserList.reloadData()
//    }
  
 
//            let deleteAction = UIContextualAction(style: .destructive, title: "Delete")   { (action, view, completion) in
//                self.deleteItem(at: indexPath)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                completion(true)
//            }
//            self.tblViewForUserList.reloadData()
//            deleteAction.image = UIImage(systemName: "trash")
//            deleteAction.backgroundColor = .lightGray
//
//            let config = UISwipeActionsConfiguration(actions: [deleteAction])
//            return config
//
//func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//        let user = users[indexPath.row]
//        guard let documentID = user.documentID else {
//            print("Error: The documentID is nil.")
//            return
//        }
//
//        let db = Firestore.firestore()
//        db.collection("User Details").document(documentID).delete { (error) in
//            if let error = error {
//                print("Error deleting user: \(error)")
//            } else {
//                self.users.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                self.deleteItem(at: indexPath)
//            }
//        }
//    }
//}
//
//func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//        let user = users[indexPath.row]
//         let documentID = user.documentID
////            else {
////                print("Error: The documentID is nil.")
////                return
////            }
//
//        let db = Firestore.firestore()
//        db.collection("User Details").document(documentID).delete { (error) in
//            if let error = error {
//                print("Error deleting user: \(error)")
//            } else {
//                self.users.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//                self.deleteItem(at: indexPath)
//            }
//        }
//    }



//    func fetchUserDetails() {
//        let userCollectionRef = db.collection("User Details")
//        let userDocumentRef = userCollectionRef.document()
//
//        userDocumentRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let data = document.data()
//                if let name = data?["name"] as? String,
//                   let gender = data!["gender"] as? String,
//                   let language = data!["language"] as? String,
//                   let email = data!["email"] as? String,
//                   let password = data!["password"] as? String {
//                    self.updateUI(name: name, gender: gender, language: language, email: email, password: password)
//                } else {
//                }
//            } else {
//            }
//        }
//    }
//    func updateUI(name: String, gender: String, language: String, email: String, password: String) {
//        print("Name....\(lblForName.text = name)")
//        print("Gender....\(lblForGender.text = gender)")
//        print("Language....\( lblForLanguage.text = language)")
//        print("Email....\( lblForEmail.text = email)")
//        print("Password....\(lblForPassword.text = password)")
//    }


//

// MARK: - Negative CASES


//func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
//        // Delete user details from Firebase Realtime Database
//        let user = self.userData[indexPath.row]
//        let ref = Firestore.firestore()
//        ref.collection("UserDetails").document().delete { error in
//            if let error = error {
//                print("Error deleting user: \(error)")
//            } else {
//                self.userData.remove(at: indexPath.row)
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//        }
//    }
//
//    deleteAction.image = UIImage(systemName: "trash")
//    deleteAction.backgroundColor = .lightGray
//
//    return UISwipeActionsConfiguration(actions: [deleteAction])
//
//}


//        guard let indexPaths = signUpTableView.indexPathsForVisibleRows else {
//            return
//        }
//
//        for indexPath in indexPaths {
//            guard let cell = signUpTableView.cellForRow(at: indexPath) as? UserDataTableViewCell,
//                  let textFieldText = cell.userInputData.text else {
//                continue
//            }
//
//            switch indexPath.row {
//            case 0:
//                userData?.name = textFieldText
//            case 1:
//                userData?.age = textFieldText
//            case 2:
//                userData?.mobileNo = textFieldText
//            case 3:
//                userData?.mailId = textFieldText
//            case 4:
//                userData?.gender = textFieldText
//            case 5:
//                userData?.language = textFieldText
//            default:
//                break
//            }
//        }
        
        // Update the data in Firebase Firestore
       //  updateDataInFirestore()


//    func updateDataInFirestore() {
//        guard let userData = userData else {
//            return
//        }
//        ref.collection("UserDetails").order(by: "timestamp", descending: true).limit(to: 1).getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error retrieving documents: \(error)")
//                return
//            }
//
//            guard let document = querySnapshot?.documents.first else {
//                print("No documents found")
//                return
//            }
//            let docRef = self.ref.collection("UserDetails").document(document.documentID)
//
//            docRef.updateData([
//                "name": userData.name,
//                "age": userData.age,
//                "mobileNo": userData.mobileNo,
//                "mailId": userData.mailId,
//                "gender": userData.gender,
//                "language": userData.language
//            ]) { error in
//                if let error = error {
//                    print("Error updating document: \(error)")
//                } else {
//                    print("Document successfully updated")
//                }
//            }
//        }
//
//    }




//    func loadDataFromFireBase(){
//
//        ref.collection("UserDetails").getDocuments { [weak self] (querySnapshot, error) in
//            guard let snapshot = querySnapshot else {
//                print("Error fetching documents: \(error!)")
//                return
//            }
//            self?.userData = snapshot.documents.compactMap { document in
//                let documentData = document.data()
//                guard
//                    let name = documentData["Name"] as? String,
//                    let age = documentData["Age"] as? String,
//                    let mobileNo = documentData["Mobile Number"] as? String,
//                    let mailId = documentData["Email Address"] as? String,
//                    let gender = documentData["Gender"] as? String,
//                    let language = documentData["Language"] as? String else {
//                    return nil
 //               }
//
//                return UserDetail(name: name, age: age, mobileNo: mobileNo, mailId: mailId, gender: gender, language: language)
//            }
//            print("DATA...\(self!.userData)")
//            self?.signUpTableView.reloadData()
//        }
//    }
  


//        func getValueForIndexPath(_ indexPath: IndexPath) -> String {
//                let model = userData[indexPath.row]
//
//                switch indexPath.row {
//                case 0:
//                    return model.name
//                case 1:
//                    return model.age
//                case 2:
//                    return model.mobileNo
//                case 3:
//                    return model.mailId
//                case 4:
//                    return model.gender
//                case 5:
//                    return model.language
//                default:
//                    return ""
//                }
//            }
 //   }
  //MARK: - SELCETED USER
//    func selectedUserItem(){
//        if let selectedUser = selectedUser {
//            print("Name....\(txtFieldForName.text = selectedUser.name)")
//            print("Gender....\(txtFieldForGender.text = selectedUser.gender)")
//            print("Language....\( txtFieldForLanguage.text = selectedUser.language)")
//            print("Email....\( txtFieldForEmail.text = selectedUser.email)")
//            print("Password....\(txtFieldForPassword.text = selectedUser.password)")
//        }
//    }
//    func updateUserDetails(name: String,gender: String, language: String, email: String, password: String ) {
//        var ref: DocumentReference? = nil
//        ref = db.collection("User Details").addDocument(data: [
//            "name": name,
//            "gender": gender,
//            "language": language,
//            "email": email,
//            "password": password
//
//        ]) { error in
//            if let error = error {
//                print("Error adding document: \(error)")
//            } else {
//                print("Document updated with ID: \(ref!.documentID)")
//            }
//        }
//    }
//    func buttonTapped(){
//        guard let name = txtFieldForName.text,
//              let gender = txtFieldForGender.text,
//              let language = txtFieldForLanguage.text,
//              let email = txtFieldForEmail.text,
//              let password = txtFieldForPassword.text else {
//            return
//        }
//        updateUserDetails(name: name, gender: gender, language: language, email: email, password: password)
//    }

//MARK: - TV DElete
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let user = users[indexPath.row]
//            let documentID = user.documentID
//
//            if !documentID.isEmpty {
//                let db = Firestore.firestore()
//                db.collection("User Details").document(documentID).delete { (error) in
//                    if let error = error {
//                        print("Error deleting user: \(error)")
//                    } else {
//                        self.users.remove(at: indexPath.row)
//                        tableView.deleteRows(at: [indexPath], with: .fade)
//                        self.deleteItem(at: indexPath)
//                    }
//                }
//            } else {
//                print("Error: The documentID is empty.")
//            }
//            self.tblViewForUserList.reloadData()
//        }
//    }


//    func updateToFirebase(){
//        guard let name = txtFieldForName.text,
//              let gender = txtFieldForGender.text,
//              let language = txtFieldForLanguage.text,
//              let email = txtFieldForEmail.text,
//              let password = txtFieldForPassword.text else {
//            return
//        }
//        let userID = users[selectedItem].id
//        db.collection("User Details").document(userID).updateData(["name": name, "gender": gender, "language": language, "email": email, "password": password]){ error in
//            if let error = error {
//                print("Error writing document: \(error)")
//            } else {
//                DispatchQueue.main.async {
//                    self.fetchData() }
//                print("Document successfully updated!") }
//        }
//    }
//MARK: - Animation
//class FadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.5 // Set the duration of the fade transition
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let toView = transitionContext.view(forKey: .to) else { return }
//        toView.alpha = 0
//        transitionContext.containerView.addSubview(toView)
//
//        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
//            toView.alpha = 1
//        }, completion: { _ in
//            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//        })
//    }
//}

//            UIView.animate(withDuration: 1.5, animations: {
//                self.logoImageView.transform = CGAffineTransform(translationX: 0, y: -self.view.safeAreaInsets.top)
//            }) { (_) in
//                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
//                    self.navigationController?.pushViewController(vc, animated: true) }
//            }

