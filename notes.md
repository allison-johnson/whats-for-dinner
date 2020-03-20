[] Add more categories. Ability to also create a new one?

[] Error messages if new recipe reloads - including sepcific error on ingredient

[] Homepage: 
    [] "Welcome Alan!"
    [x] Link on nav bar to create new recipe
    [] What else should be on home page? --> make this a user's home page with a list of their contributed recipes

[] Use a form partial

[] Comment RecipeIngredient class ... what is the purpose of that helper method?

[] Nested routes

[] Add filters to index page
    - By primary ingredient
    - By owner
    - Sort by number of saves?

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