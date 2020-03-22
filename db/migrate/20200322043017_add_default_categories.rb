class AddDefaultCategories < ActiveRecord::Migration[6.0]
  def change
    Category.create(name: "Chicken")
    Category.create(name: "Beef")
    Category.create(name: "Seafood")
    Category.create(name: "Eggs")
    Category.create(name: "Beans")
    Category.create(name: "Tofu")
    Category.create(name: "Pasta")
    Category.create(name: "Vegetable")
    Category.create(name: "Grain")
  end
end
