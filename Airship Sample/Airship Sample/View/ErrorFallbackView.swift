/* Copyright Airship and Contributors */

import SwiftUI

struct ErrorFallbackView: View {
    let error: (any Error)?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 32) {
                    Spacer(minLength: 60)
                    
                    // Error Icon
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 64))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.orange, .red],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text("Airship failed to initialize (takeOff)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Error Details Card
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.blue)
                                Text("Error Details")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            
                            Text(error?.localizedDescription ?? "Unknown error occurred")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.leading, 24)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.quaternary, lineWidth: 1)
                                )
                        )
                        
                        // Troubleshooting Tips
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "wrench.and.screwdriver.fill")
                                    .foregroundColor(.green)
                                Text("How to Fix This")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                TipRow(icon: "1.circle.fill", text: "Update your Airship credentials in AirshipInitializer.swift")
                                TipRow(icon: "2.circle.fill", text: "Verify your App Key and App Secret are correct")
                                TipRow(icon: "3.circle.fill", text: "Rebuild and run the app after updating credentials")
                            }
                            .padding(.leading, 24)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.quaternary, lineWidth: 1)
                                )
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    // Action Buttons
                    VStack(spacing: 16) {
                        Button(action: openDocumentation) {
                            HStack {
                                Image(systemName: "book.fill")
                                Text("View Documentation")
                                    .fontWeight(.medium)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.ultraThinMaterial)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(.quaternary, lineWidth: 1)
                                    )
                            )
                            .foregroundColor(.primary)
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer(minLength: 60)
                }
            }
        }
        .background(
            LinearGradient(
                colors: [
                    Color(.systemBackground),
                    Color(.systemBackground).opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
    
    private func openDocumentation() {
        if let url = URL(string: "https://docs.airship.com/platform/mobile/setup/index.html") {
            UIApplication.shared.open(url)
        }
    }
}

struct TipRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            
            Text(text)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ErrorFallbackView(error: NSError(domain: "com.example", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials provided"]))
}
