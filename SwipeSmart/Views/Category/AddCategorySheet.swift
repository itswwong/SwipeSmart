import SwiftUI

struct AddCategorySheet: View {
    @Binding var isPresented: Bool
    @Binding var addCategoryName: String
    @Binding var addCategoryExists: Bool
    @Binding var addCategoryEmpty: Bool
    @Binding var categories: [Category]
    
    @State private var selectedBackground: String = "Teal"
    @State private var showIconPicker = false // For selecting icons (you can implement this separately)
    
    let backgroundOptions = ["Red", "Blue", "Green", "Teal"]
    var onAdd: () -> Void

    var body: some View {
        VStack {
            // Close button
            HStack {
                Button(action: {
                    isPresented = false
                    resetForm()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding()
            
            // Title
            Text("Add a New Category")
                .font(.headline)
                .padding(.bottom, 16)
            
            // Input fields in HStack
            VStack(spacing: 16) {
                HStack {
                    Text("Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(width: 100, alignment: .leading)
                    
                    Spacer() // Added spacer to push input fields to the right
                    
                    VStack {
                        TextField("Ex: Groceries", text: $addCategoryName)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .onChange(of: addCategoryName) {
                                addCategoryEmpty = addCategoryName.isEmpty
                                addCategoryExists = categories.contains {
                                    $0.name.lowercased() == addCategoryName.lowercased()
                                }
                            }
                        
                        if addCategoryEmpty {
                            Text("Please enter a category name.")
                                .font(.caption)
                                .foregroundColor(.red)
                        } else if addCategoryExists {
                            Text("Category already exists.")
                                .font(.caption)
                                .foregroundColor(.red)
                        }
                    }
                    
                }
                
                HStack {
                    Text("Background")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(width: 100, alignment: .leading)
                    
                    Spacer() // Spacer to separate the label and dropdown
                    
                    Picker("Background", selection: $selectedBackground) {
                        ForEach(backgroundOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(5)
                    .frame(maxWidth: .infinity) // Ensure it fills the remaining space
                    .background(Color.gray.opacity(0.2)) // Match background style
                    .cornerRadius(8) // Match corner radius
                }

                
                HStack {
                    Text("Icon")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(width: 100, alignment: .leading)
                    
                    Spacer() // Added spacer
                    
                    Button(action: {
                        showIconPicker.toggle()
                    }) {
                        HStack {
                            Text("Select Icon")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Add Category button
            Button(action: {
                onAdd()
                isPresented = false
            }) {
                Text("Add Category")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            .disabled(addCategoryName.isEmpty || addCategoryExists)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .presentationDetents([.fraction(0.6)]) // Sheet height set to half the screen
    }
    
    private func resetForm() {
        addCategoryName = ""
        addCategoryExists = false
        addCategoryEmpty = true
    }
}
