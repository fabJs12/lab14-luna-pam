import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    
    private init() {}
    
    func login(correo: String, contrasena: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: correo, password: contrasena) { authResult, error in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    func registrar(correo: String, contrasena: String, nombres: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: correo, password: contrasena) { authResult, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let user = authResult?.user else {
                completion(false, NSError(domain: "FirebaseManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "No se pudo obtener el usuario creado."]))
                return
            }
            
            let db = Firestore.firestore()
            let userData: [String: Any] = [
                "id": user.uid,
                "nombres": nombres,
                "correo": correo
            ]
            
            db.collection("usuarios").document(user.uid).setData(userData) { fsError in
                if let fsError = fsError {
                    completion(false, fsError)
                } else {
                    completion(true, nil)
                }
            }
        }
    }
}
