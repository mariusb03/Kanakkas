//
//  SettingsView.swift
//  Kanakkas
//
//  Created by Marius Bringsvor Rusten on 05/03/2025.
//


import SwiftUI

struct SettingsView: View {
    var dismiss: () -> Void // Closure to close the info view

    var body: some View {
        ZStack {
            // 🔹 Blurred Background
            VisualEffectBlurView()
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismiss() // Dismiss when tapping outside
                }
            
            // 📜 Info Card
            
           
                VStack() {
                    
                    ScrollView {
                        Text("Innstillinger!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 34))
                            .foregroundColor(.white)
                            .shadow(color: .red, radius: 5)
                        
                        Spacer()
                        
                        Text("Har du forslag til nye spill? \n Send dem gjerne til oss anonymt her!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        HStack {
                            TextField("Forslag", text: .constant(""))
                                .frame(height: 10)
                                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            
                            
                            Button("Send") {
                                // Handle send action
                            }
                            
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        .padding(.horizontal)
                        
                        Text("Eller ta kontakt med oss på instagram her!")
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button(action: {
                            openInstagramProfile(username: "brirusapps")
                        }) {
                            HStack {
                                Image("instagramLogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                    
                                Text("Kontakt oss!")
                                    .padding(.top, 5)
                                    .foregroundColor(.red)
                            }
                            .font(Font.custom("LuckiestGuy-Regular", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                        }
                        .padding(.horizontal)
                        
                        legalSection
                        
                        Spacer()
                        
                        // ❌ Close Button
                        Button(action: dismiss) {
                            Text("Lukk")
                                .font(Font.custom("LuckiestGuy-Regular", size: 24))
                                .padding()
                                .frame(width: 100)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding(.top, 20)
                    }
                    .padding()
                    .frame(width: 700, height: 370)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.top)
                }
                
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func openInstagramProfile(username: String) {
        let appURL = URL(string: "instagram://user?username=\(username)")!
        let webURL = URL(string: "https://instagram.com/\(username)")!

        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(webURL)
        }
    }
    
    // MARK: - Legal & Policies Section
    private var legalSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Personvern og retningslinjer!")
                
                .font(Font.custom("LuckiestGuy-Regular", size: 24))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .center)

            // Privacy Policy Link
            Link("📜 Personvernserklæring", destination: URL(string: "https://sites.google.com/view/kanakkas/personvernerkl%C3%A6ring")!)
                
                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                .foregroundStyle(.white)
                .underline()
                .frame(maxWidth: .infinity)
            
            // Apple Standard EULA Link
            Link("📄 Apple's Standard EULA", destination: URL(string: "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/")!)
                
                .font(Font.custom("LuckiestGuy-Regular", size: 20))
                .foregroundStyle(.white)
                .underline()
                .frame(maxWidth: .infinity)
        }
        .padding()
        
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    
}



// 🛠 Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(dismiss: {})
    }
}
