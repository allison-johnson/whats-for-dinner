[x] Add 'instructions' to new recipe form/create

    [x] Better way do this using, say, a params[:instructions] array and then adding all elements of that array to @recipe.instructions in recipe#create?

        If recipe is not valid and form is re-rendered, instructions don't auto-populate?  
        THEY DO NOW! WRITE BLOG ABOUT THIS =)

[] Add more categories. Ability to also create a new one?

[x] Can only access recipes/new if logged in

[] Validations
    [x] Recipe
    [] Ingredient
        - When name is blank, how do I get the error message for ingredients to appear in the errors section of the new recipe form? 
    [x] num_steps must be a number
    [] RecipeStep

[] Error messages if new recipe reloads - including error on ingredient

[] Homepage: 
    [] "Welcome Alan!"
    [x] Link on nav bar to create new recipe
    [] What else should be on home page?

[x] Link to 'save recipe' on show page
    [] Only appears if user is logged in AND doesn't already have recipe in their box

[] Edit/update recipe (if owner)

[] Comment RecipeIngredient class ... what is the purpose of that helper method?

[] Recipe show page - include times saved

[x] Add category model class
    Change category to category_id in recipes table
    Recipe belongs_to category
    Category has_many recipes
    Add category to recipe show page

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

[] Add comments to recipe's show page

[] If user is logged in, they can save the recipe to their box

[x] User can view recipe box (all saved recipes)

[] Style nav bar with bootstrap (see bookmarked link)

Enoch!!!
[] User does not get instantiated with a first_name and last_name (I added those to users table afterwards...)
    - Then change Nav bar to say Hi, Alan!

[] Do I need these in my whitelisted params since I'm not using checkboxes anymore?
    :recipe_ingredients_ids
    :recipe_steps_ids

[] Extension until Sunday?