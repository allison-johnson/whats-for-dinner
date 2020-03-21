[] Nest recipes under categories 
    /categories/chicken/recipes -> loads chicken recipes
    /recipes -> loads all recipes

    /categories/chicken/recipes/new -> creates new chicken recipe

[] Filter

[] Add more categories. Ability to also create a new one?

[] Error messages if new recipe reloads - including sepcific error on ingredient

[] Homepage: what should it have?

[] Use a form partial

[] Comment RecipeIngredient class ... what is the purpose of that helper method?

[] Seed database

[] Check authentication on nested routes ... other users should not be able to see a different user's recipe index 

[] Ability to filter recipes by owner?
    [] User should see users' first and last names, not email addresses... (maybe User model class method full_name?)

[] Where error is appearing (2x) when you a try to access recipes of a user who does not exist

[x] Nested routes
    [x] Recipes index
    [x] New recipe

[] Add filters to index page (scope method) -- by category, owner

[] Omniauth for 3rd party login

[] Organize Recipe Index page
    - Use a table
    - Organize by category
    - Within category, sort by number of saves

[] Comment form on recipe show page

[] Add comments to recipe's show page and/or to user's recipe box

[] Style nav bar with bootstrap (see bookmarked link)

[] Do I need these in my whitelisted params since I'm not using checkboxes anymore?
    :recipe_ingredients_ids
    :recipe_steps_ids

Nested Resources
- recipe is a nested resource for a user because a user has ownership of that recipe
- /user/1/recipes --> restful url for nested resource (index)
- /user/1/recipes/new (new)