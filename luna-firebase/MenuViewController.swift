import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let opciones = ["Catálogo de Servicios", "Mis Citas", "Mi Perfil"]
    private let cellIdentifier = "MenuCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        // Registering cell class programmatically for safety and clean compiles
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView() // Clear extra separator lines
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = opciones[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        // Aesthetic details
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "segueMenuToServicios", sender: self)
        case 1:
            self.performSegue(withIdentifier: "segueMenuToCitas", sender: self)
        case 2:
            self.performSegue(withIdentifier: "segueMenuToPerfil", sender: self)
        default:
            break
        }
    }
}
