import UIKit
import SwiftUI

class ServicioDetailViewController: UIViewController {

    var servicio: Servicio?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        guard let servicio = servicio else {
            // Fallback default mock service to avoid empty screen
            let defaultServicio = Servicio(nombre: "Servicio Estético", precio: 0.0, descripcion: "Información del servicio no disponible.")
            embedSwiftUIView(for: defaultServicio)
            return
        }
        
        embedSwiftUIView(for: servicio)
    }
    
    private func embedSwiftUIView(for servicio: Servicio) {
        self.title = servicio.nombre
        
        // Create SwiftUI view
        let swiftUIView = TarjetaServicioComponent(
            nombre: servicio.nombre,
            precio: servicio.precio,
            descripcion: servicio.descripcion
        )
        
        // Initialize UIHostingController
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Embed the Hosting Controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Auto Layout constraints
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            hostingController.view.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            hostingController.view.heightAnchor.constraint(equalToConstant: 320) // Set comfortable height for card
        ])
        
        hostingController.didMove(toParent: self)
        hostingController.view.backgroundColor = .clear
    }
}
