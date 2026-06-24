import UIKit
import SwiftUI
import FirebaseAuth

class PerfilViewController: UIViewController {

    @IBOutlet weak var btnCerrarSesion: UIButton?
    
    private var programmaticButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Mi Perfil"
        view.backgroundColor = .systemBackground
        
        // 1. Embed SwiftUI TarjetaAlumnoView
        let targetView = TarjetaAlumnoView()
        let hostingController = UIHostingController(rootView: targetView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear
        
        // Card constraints (centered in the view)
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            hostingController.view.heightAnchor.constraint(equalToConstant: 380)
        ])
        
        hostingController.didMove(toParent: self)
        
        // 2. Configure closing button
        if let storyboardButton = btnCerrarSesion {
            storyboardButton.backgroundColor = .systemRed
            storyboardButton.setTitleColor(.white, for: .normal)
            storyboardButton.layer.cornerRadius = 12
            storyboardButton.clipsToBounds = true
            storyboardButton.addTarget(self, action: #selector(cerrarSesionAccion), for: .touchUpInside)
        } else {
            // Programmatic fallback button
            let button = UIButton(type: .system)
            button.setTitle("Cerrar Sesión", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            button.backgroundColor = .systemRed
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(cerrarSesionAccion), for: .touchUpInside)
            
            view.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: hostingController.view.bottomAnchor, constant: 30),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
            self.programmaticButton = button
        }
    }
    
    @objc private func cerrarSesionAccion() {
        try? Auth.auth().signOut()
        
        // Dismiss view controller or pop to root
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
