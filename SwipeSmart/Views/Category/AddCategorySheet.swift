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
    
    var onAdd: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                TextField("Category Name", text: $addCategoryName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: addCategoryName) {
                        addCategoryEmpty = addCategoryName.isEmpty
                        addCategoryExists = categories.contains {
                            $0.name.lowercased() == addCategoryName.lowercased()
                        }
                    }

                if addCategoryEmpty {
                    Text("Please enter a category name.")
                        .foregroundStyle(.red)
                } else if addCategoryExists {
                    Text("Category already exists.")
                        .foregroundStyle(.red)
                }
                
                Spacer()
            }
            .navigationTitle("Add New Category")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        onAdd()
                        isPresented = false // Close the sheet
                    }
                    .disabled(addCategoryName.isEmpty || addCategoryExists)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                        resetForm()
                    }
                }
            }
        }
    }
    
    private func resetForm() {
        addCategoryName = ""
        addCategoryExists = false
        addCategoryEmpty = true
    }
}

