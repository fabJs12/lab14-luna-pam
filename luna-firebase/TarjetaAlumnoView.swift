import SwiftUI

struct TarjetaAlumnoView: View {
    var body: some View {
        VStack(spacing: 24) {
            // Profile image / Avatar
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: Color.purple.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            .padding(.top, 10)
            
            // Name and Role
            VStack(spacing: 6) {
                Text("Fabrizio Humberto")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Estudiante Institucional")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
                    .tracking(1.5)
            }
            
            Divider()
                .padding(.horizontal)
            
            // Details List with SF Symbols
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 12) {
                    Image(systemName: "graduationcap.fill")
                        .font(.title3)
                        .foregroundColor(.purple)
                        .frame(width: 30, height: 30)
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Carrera")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                        Text("Diseño y Desarrollo de Software")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                }
                
                HStack(spacing: 12) {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(width: 30, height: 30)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Ciclo")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                        Text("5to Ciclo")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                }
                
                HStack(spacing: 12) {
                    Image(systemName: "building.2.crop.left.fill")
                        .font(.title3)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 30)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Institución")
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .textCase(.uppercase)
                        Text("Tecsup")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            
            Spacer()
        }
        .padding(24)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
    }
}

struct TarjetaAlumnoView_Previews: PreviewProvider {
    static var previews: some View {
        TarjetaAlumnoView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
