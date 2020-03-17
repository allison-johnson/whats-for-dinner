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

[] Can only access recipes/new if logged in

[] New ingredient form (and link to it from home page)
    [] Also link to new ingredient from new recipe? If so, would you be able to return to pre-populated new recipe upon submission of new ingredient?

[] Home page 

[] Recipe show page - include times saved

[x] Add category model class
    Change category to category_id in recipes table
    Recipe belongs_to category
    Category has_many recipes
    Add category to recipe show page

[x] Hidden field for owner_id

[] 

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

[] Figure out how to create ingredient/recipe_ingredients nested inside 'new recipe' form
    Ideally, ingredients would be checkboxes WITH an option to enter your own ingredients as well
    BUT I feel like Recipe should also accept_nested_attributes_for :ingredients
        - The problem is that ingredients actually only has one attribute, the name!

        - What I really want is for Recipe to accept_nested_attributes_for :recipe_ingredients, which contains information about the ingredient and the quantity
            - The problem is that upon creation of the ingredient, the recipe_id isn't known
            - Also, it uses the ingredient_id, which is not what the user should be entering into the form...

        - Maybe what I need is to adjust the recipe_ingredients table to include ingredient_name instead of ingredient_id 

            - ALSO! Use 'new ingredient' form instead of having user create new ingredients in the context of the 'new recipe' form

Recipe:
accepts_nested_attributes_for :ingredients
accepts_nested_attributes_for :recipe_ingredients

<%= f.fields_for :recipe_ingredients do |recipe_ingredient| %>
  #Delete next 2 lines b/c recipe doesn't have an ID yet!
  <%= recipe_ingredient.label :recipe_id %>
  <%= recipe_ingredient.text_field :recipe_id %>

  <%= recipe_ingredient.label "Ingredient Name: " %>
  <%= recipe_ingredient.text_field :ingredient_id %>

  <%= recipe_ingredient.label "Amount: " %>
  <%= recipe_ingredient.text_field :quantity %>