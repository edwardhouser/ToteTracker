//
//  Signup View.swift
//  ToteTracker
//
//  Created by Edward Houser on 2/5/26.
//

import SwiftUI
import SwiftData

struct SignupView: View {
    @Environment(\.modelContext) private var modelContext
    
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @AppStorage("userId") private var userId: String = ""
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    @State var errorMessage: String = ""
    @State var showError: Bool = false
    
    
    
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                Backgrounds.gradient1.ignoresSafeArea()
                
                VStack{
                    
                    VStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width:60, height: 60)
                            .foregroundStyle(Color(.white))
                        
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.white))
                        Text("Create An Account")
                            .font(.subheadline)
                            .foregroundStyle(Color(.secondaryLabel))
                    }
                    .padding(.bottom, 30)
                    
                    //Sign-in Form
                    
                    VStack(spacing: 20){  //Spacing here tells you vertical spacing between the items in the vstack
                        
                        //error message
                        
                        if showError {
                            HStack{
                                Text(errorMessage)
                                    .font(.caption)
                                    .foregroundStyle(Color(.white))
                                Spacer()
                                Button("Dismiss"){
                                    showError = false
                                }
                                .font(.caption)
                                .foregroundStyle(Color(.white))
                            }
                            .padding()
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(10)
                        }
                        
                        //Signup Fields
                        
                        TextField("Email", text: .constant(""))
                            .textFieldStyle(.plain)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(.white.opacity(0.8))
                            .cornerRadius(10)
                        
                        TextField("Phone", text: .constant(""))
                            .textFieldStyle(.plain)
                            .padding()
                            .background(.white.opacity(0.8))
                            .cornerRadius(10)
                        
                        TextField("Name", text: .constant(""))
                            .textFieldStyle(.plain)
                            .padding()
                            .background(.white.opacity(0.8))
                            .cornerRadius(10)
                        
                        
                        Button(action:{performSignup()}){
                            Text("Sign Up")
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 40)
                        
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
        
       
    }
    
    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
    
    private func performSignup() {
        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
            print("Please enter all signup fields")
            return
        }
        
        
        let newUser = User(
            name: username,
            email: email,
            password: password
            )
        modelContext.insert(newUser)
        
        do {
            try modelContext.save()
            print("User Saved")
            userId = newUser.id
            isLoggedIn = true
            
        } catch {
            print("Error Saving User: \(error)")
        }
        
    }
}

//#Preview {
//    SignupView()
//}
