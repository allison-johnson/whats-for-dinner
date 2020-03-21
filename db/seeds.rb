# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Users
allison = User.create(first_name: "Allison", last_name: "Johnson", email: "ajohnson@gmail.com", password: "secret", password_confirmation: "secret")
kim = User.create(first_name: "Kim", last_name: "Nolan", email: "knolan@gmail.com", password: "secret", password_confirmation: "secret")
jennifer = User.create(first_name: "Jennifer", last_name: "O'Boyle", email: "joboyle@gmail.com", password: "secret", password_confirmation: "secret")
tiffany = User.create(first_name: "Tiffany", last_name: "Michel", email: "tmichel@gmail.com", password: "secret", password_confirmation: "secret")
#users = [allison, kim, jennifer, tiffany]

#Create Categories
chicken = Category.create(name: "Chicken")
beef = Category.create(name: "Beef")
seafood = Category.create(name: "Seafood")
eggs = Category.create(name: "Eggs")
beans = Category.create(name: "Beans")
tofu = Category.create(name: "Tofu")
pasta = Category.create(name: "Pasta")
vegetable = Category.create(name: "Vegetable")
grain = Category.create(name: "Grain")

#Create Recipes
for num in 1..100
  Recipe.create(name: "Recipe #{num}", owner_id: User.all.sample.id, category_id: Category.all.sample.id, num_steps: rand(2..10), num_ingredients: rand(2..10))
end

#Create Ingredients
for num in 1..300
  Ingredient.create(name: "Ingredient #{num}")
end

#Create RecipeIngredients
quantities = ["1 cup", "1/2 cup", "1/4 cup", "2 cups", "1 tsp", "1/2 tsp", "Pinch", "1 tbsp", "2 tbsp", "3 tbsp", "2 tsp", "3 tsp", "1 can", "1/2 pound", "1 pound", "2 pounds"]
Recipe.all.each do |recipe|
  recipe.num_ingredients.times do 
    r = RecipeIngredient.create(quantity: quantities.sample, ingredient_id: Ingredient.all.sample.id, recipe_id: Recipe.all.sample.id)
    recipe.recipe_ingredients << r
  end
  recipe.save 
end

#Create RecipeSteps
Recipe.all.each do |recipe|
  for num in 1..recipe.num_steps do
    r = RecipeStep.create(content: "Content of step #{num}", recipe_id: recipe.id, step_number: num)
    recipe.recipe_steps << r 
  end
  recipe.save 
end

