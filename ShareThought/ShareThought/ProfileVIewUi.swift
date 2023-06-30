//
//  ProfileVIewUi.swift
//  ShareThought
//
//  Created by Vishal M on 25/06/23.
//


import SwiftUI

struct ProfileVIewUi: View {
    @State private var prefixName: String = ""
    @State private var name: String = ""
    @State private var dob: String = ""
    @State private var email: String = ""
    @State var showsAlert = false
    
    var body: some View {
        VStack {
            ScrollView {
                ProfileView(
                    name: $name,
                    dob: $dob,
                    email: $email,
                    prefixName: $prefixName
                )
            }
            
            Spacer()

            Button(action: {
                          self.showsAlert = true
                      }) {
                          Text("Click Alert")
                          .foregroundColor(Color.white)
                      }
                      .padding()
                      .background(Color.blue)
                      .alert(isPresented: $showsAlert) { () -> Alert in
                          Alert(title: Text("iOSDevCenters"), message: Text("This Tutorial for SwiftUI Alert."), primaryButton: .default(Text("Okay"), action: {
                              print("Okay Click")
                          }), secondaryButton: .default(Text("Dismiss")))
                  }
                
        }
    }
    
    func isFormValid() -> Bool {
        return !name.isEmpty && !dob.isEmpty && !email.isEmpty
    }
    
    func sendRequest() {
        let person = Person()
        person.title = prefixName
        person.name = name
        person.gender = "Gender" // Replace with actual gender value
        person.email = email
        
        // Print the entered values
        print("Title: \(person.title ?? "")")
        print("Name: \(person.name ?? "")")
        print("Gender: \(person.gender ?? "")")
        print("Email: \(person.email ?? "")")
    }
}


struct ProfileView: View {
    @Binding var name: String
    @Binding var dob: String
    @Binding var email: String
    @Binding var prefixName: String
    @State var isShowing: Bool = false
    @State var maleGenderImageName = "male"
    @State var femaleGenderImageName = "female"
    @State var otherGenderImageName = "other"
    
    enum GenderButton {
           case male
           case female
           case other
       }
       
       func setActiveImage(button: GenderButton) {
           switch button {
           case .male:
               maleGenderImageName = "maleActive"
               femaleGenderImageName = "female"
               otherGenderImageName = "other"
           case .female:
               maleGenderImageName = "male"
               femaleGenderImageName = "femaleActive"
               otherGenderImageName = "other"
           case .other:
               maleGenderImageName = "male"
               femaleGenderImageName = "female"
               otherGenderImageName = "otherActive"
           }
       }
    
    var body: some View {
        VStack(spacing: 50) {
            
            ZStack {
                Image("home_Icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 110)
                    .cornerRadius(55)
                    .overlay(
                        Circle()
                            .stroke(Color.red, lineWidth: 4)
                    ) // Add border
                
                Button(action: {
                    print("Edit Image")
                }) {
                    Image(systemName: "camera.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 40)
                .background(Color.black)
                .clipShape(Circle())
                .offset(x: 0, y: 55) // Adjust the offset to position the button on the border
            }
            .padding(.top, 50)
            
            
            VStack(spacing: 20) {
                
                VStack {
                    HStack {
                        Text("Title")
                        Spacer()
                    }
                    .padding(.leading, 20) // Add leading padding of 20
                    
                    TextField("Mr", text: self.$prefixName)
                        .frame(height: 45)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 20)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary))
                        .padding([.horizontal], 20)
                }
                
                VStack {
                    HStack {
                        Text("Full Name")
                        Spacer()
                    }
                    .padding(.leading, 20) // Add leading padding of 20
                    
                    TextField("Name", text: self.$name)
                        .frame(height: 45)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 20)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary))
                        .padding([.horizontal], 20)
                }
                
                VStack {
                    HStack {
                        Text("Gender")
                        Spacer()
                    }
                    .padding(.leading, 20) // Add leading padding of 20
                    HStack(spacing: 20){
                        
                        Button(action: {
                            setActiveImage(button: .male)
                        }) {
                            Image(self.maleGenderImageName)
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            setActiveImage(button: .female)
                        }) {
                            Image(self.femaleGenderImageName)
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            setActiveImage(button: .other)
                        })
                        {
                            Image(self.otherGenderImageName)
                                .resizable()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.white)
                        }
                        Spacer()
                        
                    }.padding(.leading,20)
                    
                }
                VStack {
                    HStack {
                        Text("Date Of Birth")
                        Spacer()
                    }
                    .padding(.leading, 20) // Add leading padding of 20
                    TextField("Date Of Birth", text: self.$dob)
                        .frame(height: 45)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 20)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary))
                        .padding([.horizontal], 20)
                }
                
                VStack {
                    HStack {
                        Text("Email")
                        Spacer()
                    }
                    .padding(.leading, 20) // Add leading padding of 20
                    TextField("example@gmail.com", text: self.$email)
                        .frame(height: 45)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 20)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.secondary))
                        .padding([.horizontal], 20)
                }
            }
        }
    }
}

struct ProfileVIewUi_Previews: PreviewProvider {
    static var previews: some View {
        ProfileVIewUi()
    }
}

class Person: Codable {
    var title: String?
    var name: String?
    var gender: String?
    var contact: Int?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case name
        case gender
        case contact
        case email = "Email"
    }
}

