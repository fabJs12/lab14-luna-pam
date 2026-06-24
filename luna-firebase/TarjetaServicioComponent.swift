import SwiftUI

struct TarjetaServicioComponent: View {
    let nombre: String
    let precio: Double
    let descripcion: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Icon / Header image simulation
            ZStack(alignment: .topTrailing) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.6)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 120)
                
                Image(systemName: "sparkles")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Text(nombre)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(String(format: "S/ %.2f", precio))
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                
                Text(descripcion)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineSpacing(4)
                    .padding(.top, 4)
            }
            
            Spacer()
        }
        .padding(20)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

struct TarjetaServicioComponent_Previews: PreviewProvider {
    static var previews: some View {
        TarjetaServicioComponent(
            nombre: "Limpieza Facial Profunda",
            precio: 80.0,
            descripcion: "Eliminación de impurezas, puntos negros y células muertas para una piel radiante y saludable."
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
