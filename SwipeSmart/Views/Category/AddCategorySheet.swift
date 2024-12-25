//
//  AddCategorySheet.swift
//
//
//
import SwiftUI

struct AddCategorySheet: View {
    @Binding var isPresented: Bool
    @Binding var addCategoryName: String
    @Binding var addCategoryExists: Bool
    @Binding var addCategoryEmpty: Bool
    @Binding var categories: [Category]
    
    var onAdd: () -> Void // Update to include background color

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
                .buttonStyle(.plain)
                Spacer()
            }
            .padding()
            
            Spacer()
            
            // Title
            Text("Add a New Category")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .foregroundStyle(.black)
            
            Spacer()
            
            // Input fields
            VStack() {
                HStack {
                    Text("NAME")
                        .foregroundColor(.gray)
                        .frame(width: 100, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        TextField(text: $addCategoryName) {
                            Text("Ex: Groceries")
                                .foregroundColor(.gray)
                        }
                            .foregroundStyle(.black)
                            .padding(10)
                            .background(Color.clear)
                            .cornerRadius(8)
                            .onDisappear {
                                resetForm()
                            }
                            .overlay(RoundedRectangle(cornerRadius:5).stroke(Color.gray, lineWidth: 1))
                            .frame(width: 200)
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
            }
            .padding(.horizontal)
            Spacer()
            // Add Category button
            Button(action: {
                onAdd() // Pass name
                isPresented = false
            }) {
                Text("ADD CATEGORY")
                    .frame(maxWidth: .infinity)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color("tabbar"))
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.horizontal)
            .buttonStyle(.plain)
            .disabled(addCategoryName.isEmpty || addCategoryExists)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
    }
    
    private func resetForm() {
        addCategoryName = ""
        addCategoryExists = false
        addCategoryEmpty = false
    }
}

struct AddCategorySheet_Previews: PreviewProvider {
    static var previews: some View {
        AddCategorySheet(
            isPresented: .constant(true),
            addCategoryName: .constant("Example"),
            addCategoryExists: .constant(false),
            addCategoryEmpty: .constant(false),
            categories: .constant(Category.sampleCategories),
            onAdd: {}
        )
    }
}
