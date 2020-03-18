[x] Add 'instructions' to new recipe form/create

    [] Better way do this using, say, a params[:instructions] array and then adding all elements of that array to @recipe.instructions in recipe#create?

        If recipe is not valid and form is re-rendered, instructions don't auto-populate?

[] Add more categories. Ability to also create a new one?

[x] Can only access recipes/new if logged in

[] Validations
    [x] Recipe
    [] Ingredient
        - When name is blank, how do I get the error message for ingredients to appear in the errors section of the new recipe form? 
    [x] num_steps must be a number
    [] Recipe - instructions

[] Error messages if new recipe reloads - including error on ingredient

[] Do I need these in my whitelisted params since I'm not using checkboxes anymore?
    :recipe_ingredients_ids
    :recipe_steps_ids

[] Homepage: 
    [] "Welcome Alan!"
    [] Link on nav bar to create new recipe

[] Link to 'save recipe' on show page

[] Edit/update recipe (if owner)

[] Comment RecipeIngredient class ... what is the purpose of that helper method?

[] Home page 

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

[] Comment form on recipe show page

[] Add comments to recipe's show page

[] If user is logged in, they can save the recipe to their box

[] User can view recipe box (all saved recipes)

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

  <% @num_steps.times do |i| %>
    <input type="text" name=<%="step_#{i}"%> ><br><br>
  <% end %>