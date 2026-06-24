import UIKit

class CitaCreateViewController: UIViewController {

    @IBOutlet weak var txtServicio: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnAgendar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = "Agendar Cita"
        
        // Setup DatePicker configuration (mode date and time)
        datePicker.datePickerMode = .dateAndTime
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .compact
        }
        
        btnAgendar.layer.cornerRadius = 12
        btnAgendar.clipsToBounds = true
    }
    
    @IBAction func btnAgendarTapped(_ sender: UIButton) {
        guard let servicio = txtServicio.text, !servicio.isEmpty else {
            mostrarAlerta(titulo: "Error", mensaje: "Por favor escriba el nombre del servicio.")
            return
        }
        
        let fechaSeleccionada = datePicker.date
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy"
        let fechaStr = formatter.string(from: fechaSeleccionada)
        
        formatter.dateFormat = "hh:mm a"
        let horaStr = formatter.string(from: fechaSeleccionada)
        
        // Show success alert
        let alert = UIAlertController(title: "Cita Agendada", message: "Su cita para \(servicio) el día \(fechaStr) a las \(horaStr) ha sido registrada exitosamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true) ?? self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func mostrarAlerta(titulo: String, mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
