

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    let errorDiscription = e.localizedDescription
                    
                    let alert = UIAlertController(title: errorDiscription, message: "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .cancel) { (action) in
                        self.dismiss(animated: true, completion: .none)
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: .none)
                }else{
                    self.performSegue(withIdentifier: K.registerSegue , sender: self)
                }
                
            }
        }
    }
}
