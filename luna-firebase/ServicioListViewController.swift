import UIKit

class ServicioSubtitleCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ServicioListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let servicios = [
        Servicio(nombre: "Limpieza Facial Profunda", precio: 80.0, descripcion: "Eliminación de impurezas, puntos negros y células muertas para una piel radiante."),
        Servicio(nombre: "Peeling Químico", precio: 120.0, descripcion: "Tratamiento de exfoliación química para renovar las capas de la piel y atenuar manchas."),
        Servicio(nombre: "Ácido Hialurónico", precio: 250.0, descripcion: "Relleno y perfilado de labios o surcos para hidratar y aportar volumen natural."),
        Servicio(nombre: "Toxina Botulínica (Botox)", precio: 300.0, descripcion: "Suaviza las líneas de expresión y arrugas dinámicas en frente, entrecejo y patas de gallo."),
        Servicio(nombre: "Microdermabrasión", precio: 95.0, descripcion: "Exfoliación mecánica suave con punta de diamante para mejorar la textura de la piel.")
    ]
    
    private let cellIdentifier = "ServicioCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ServicioSubtitleCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let servicio = servicios[indexPath.row]
        cell.textLabel?.text = servicio.nombre
        cell.detailTextLabel?.text = String(format: "$%.2f", servicio.precio)
        cell.accessoryType = .disclosureIndicator
        
        // Optional configuration for subtitle styling in case of UITableViewCell style value1 or subtitle
        // If registering UITableViewCell.self, it uses default style. Let's make sure it's stylized.
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let servicio = servicios[indexPath.row]
        self.performSegue(withIdentifier: "segueServicioToDetail", sender: servicio)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueServicioToDetail",
           let detailVC = segue.destination as? ServicioDetailViewController,
           let servicio = sender as? Servicio {
            detailVC.servicio = servicio
        }
    }
}
