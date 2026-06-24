import UIKit

class CitaSubtitleCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CitaListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var citas: [Cita] = [
        Cita(servicio: "Limpieza Facial Profunda", fecha: "26/06/2026", hora: "10:00 AM", estado: "Programada"),
        Cita(servicio: "Peeling Químico", fecha: "30/06/2026", hora: "03:30 PM", estado: "Programada"),
        Cita(servicio: "Toxina Botulínica", fecha: "15/05/2026", hora: "11:00 AM", estado: "Completada")
    ]
    
    private let cellIdentifier = "CitaCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigation()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // Registering our custom subtitle style cell class
        tableView.register(CitaSubtitleCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
    
    private func setupNavigation() {
        self.title = "Mis Citas"
        
        let btnAgregar = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(agregarCitaTapped))
        self.navigationItem.rightBarButtonItem = btnAgregar
    }
    
    @objc private func agregarCitaTapped() {
        self.performSegue(withIdentifier: "segueCitaToCreate", sender: self)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let cita = citas[indexPath.row]
        
        cell.textLabel?.text = cita.servicio
        cell.detailTextLabel?.text = "\(cita.fecha) - \(cita.hora) (\(cita.estado))"
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        
        if cita.estado == "Programada" {
            cell.detailTextLabel?.textColor = .systemBlue
        } else {
            cell.detailTextLabel?.textColor = .systemGray
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
