[x] User has a name, email, and password. Adjust on sign up and login pages.
[x] Set up Recipe model and migration
[x] Set up SavedRecipes model and migration
[x] Add ownership to recipes (see Sinatra project), owner_id column to recipes table
[x] Set up Comment model and migration

[x] Set up associations: 
    user_recipe belongs_to user
    user_recipe belongs_to recipe

    user has_many owned_recipes
    user has_many user_recipes
    user has_many recipes through user_recipes
    user has_many comments

    recipe belongs_to owner
    recipe has_many user_recipes
    recipe has_many users through user_recipes
    recipe has_many comments 

    comment belongs_to user
    comment belongs_to recipe

[x] Ingredient as a model class? 
    ingredients table has name column

[x] recipe_ingredients table that has:
    recipe_id
    ingredient_id
    quantity (will be a drop-down)

[x] Recipe-Ingredient Associations
    recipe_ingredient belongs_to recipe
    recipe_ingredient belongs_to ingredient

    recipe has_many recipe_ingredients
    recipe has_many ingredients through recipe_ingredients

    ingredient has_many recipe_ingredients
    ingredient has_many recipes through recipe_ingredients

[x] Test out serialize :instructions in console
    serialize :instructions, Array 

[x] Sign up form
[x] Login form

[x] Recipes index page

[x] Recipe show page 
    Owner
    All recipe information

[x] Link to recipes index on nav bar

[] Home page 

[] Recipe show page - include times saved

[] Add category model class
    Change category to category_id in recipes table
    Recipe belongs_to cateogry
    Category has_many recipes

[] Add recipe form (automatically assigns owner_id to current_user's id)
    Use drop down menu for ingredient quantity
    Can select ingredient name or create new one
    Automatically associate ingredient to recipe

[] Comment form on recipe show page

[] Add comments to recipe's show page

[] If user is logged in, they can save the recipe to their box

[] User can view recipe box (all saved recipes)

[] Add filters to index page
    - By primary ingredient
    - Sort by number of saves?

[] Style nav bar with bootstrap (see bookmarked link)