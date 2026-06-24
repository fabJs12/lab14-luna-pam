import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var btnIngresar: UIButton!
    @IBOutlet weak var btnRegistrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Properties equivalent to Attributes Inspector in Xcode
        txtClave.isSecureTextEntry = true
        
        // Aesthetic styling
        btnIngresar.layer.cornerRadius = 12
        btnIngresar.clipsToBounds = true
        
        if let btnRegistrar = btnRegistrar {
            btnRegistrar.layer.cornerRadius = 12
            btnRegistrar.clipsToBounds = true
        }
    }
    
    @IBAction func btnIngresarTapped(_ sender: UIButton) {
        guard let correo = txtCorreo.text, !correo.isEmpty,
              let contrasena = txtClave.text, !contrasena.isEmpty else {
            mostrarAlerta(titulo: "Error", mensaje: "Por favor complete todos los campos.")
            return
        }
        
        // Show loading indicator or simply disable button
        btnIngresar.isEnabled = false
        
        FirebaseManager.shared.login(correo: correo, contrasena: contrasena) { [weak self] exito, error in
            guard let self = self else { return }
            self.btnIngresar.isEnabled = true
            
            if exito {
                self.performSegue(withIdentifier: "segueLoginToMenu", sender: self)
            } else {
                self.mostrarAlerta(titulo: "Error de Inicio de Sesión", mensaje: error?.localizedDescription ?? "Ocurrió un error desconocido.")
            }
        }
    }
    
    private func mostrarAlerta(titulo: String, mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
