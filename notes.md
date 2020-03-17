params[:recipe][:recipe_ingredients][0] =

{
    :ingredient_id => 3
    :quantity => "1 cup"
}

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

[x] recipes#create also creates recipe_ingredient records 

[x] Add ingredient quantity to new recipe form and recipes#create

[] Pre-new recipe form to ask user about how many ingredients they have

[x] Downcase name of ingredient before it gets saved

[] Add 'instructions' to new recipe form/create

[] Can only access recipes/new if logged in

[] Validations

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



Checkboxes for Existing Ingredients
  <%= recipe_form.collection_check_boxes(:ingredient_ids, @ingredients, :id, :name) do |b| %>
  <p>
    <%= b.check_box %>
    <%= b.label %>
  </p>
  <% end %>