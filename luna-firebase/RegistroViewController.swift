import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var txtNombres: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var btnRegistrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        txtClave.isSecureTextEntry = true
        
        btnRegistrar.layer.cornerRadius = 12
        btnRegistrar.clipsToBounds = true
    }
    
    @IBAction func btnRegistrarTapped(_ sender: UIButton) {
        guard let nombres = txtNombres.text, !nombres.isEmpty,
              let correo = txtCorreo.text, !correo.isEmpty,
              let contrasena = txtClave.text, !contrasena.isEmpty else {
            mostrarAlerta(titulo: "Error", mensaje: "Por favor complete todos los campos.")
            return
        }
        
        btnRegistrar.isEnabled = false
        
        FirebaseManager.shared.registrar(correo: correo, contrasena: contrasena, nombres: nombres) { [weak self] exito, error in
            guard let self = self else { return }
            self.btnRegistrar.isEnabled = true
            
            if exito {
                let alert = UIAlertController(title: "Registro Exitoso", message: "Usuario registrado correctamente.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                    self.navigationController?.popViewController(animated: true) ?? self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                self.mostrarAlerta(titulo: "Error de Registro", mensaje: error?.localizedDescription ?? "Ocurrió un error desconocido.")
            }
        }
    }
    
    private func mostrarAlerta(titulo: String, mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
