//
//  ModifyIngredientsView.swift
//  Recipe
//
//  Created by Kyoka Yamamoto on 2023-11-27.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground

    func addIngredient(ingredient: Ingredient) {
        ingredients.append(ingredient)
        newIngredient = Ingredient()
    }

                                    
  var body: some View {
    VStack {
      if ingredients.isEmpty {
        Spacer()
        NavigationLink("Add the first ingredient",
                       destination: ModifyIngredientView(component:
                                                            $newIngredient, createAction: addIngredient))
        Spacer()
      } else {
        List {
          ForEach(ingredients.indices, id: \.self) { index in
            let ingredient = ingredients[index]
            Text(ingredient.description)
          }.listRowBackground(listBackgroundColor)
          NavigationLink("Add another ingredient",
                         destination: ModifyIngredientView(component:
                                                            $newIngredient, createAction: addIngredient))
            .buttonStyle(PlainButtonStyle())
            .listRowBackground(listBackgroundColor)
        }.foregroundColor(listTextColor)
      }
    }
  }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
  @State static var emptyIngredients = [Ingredient]()
  static var previews: some View {
    NavigationView {
      ModifyIngredientsView(ingredients: $emptyIngredients)
    }
  }
}
