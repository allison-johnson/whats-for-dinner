To Do:
[] div class="row"
    div class="column"

[] For ingredient validations: 
    - if quantity but no name, throw an error
    - if name but not quantity, throw and error
    - if neither, just don't try to create that

[] Hard code categories (as a constant? Where?)

[] Homepage: what should it have?

[] Use form partials

[] Omniauth for 3rd party login

[] Organize Recipe Index page
    - Use a table
    - Organize by category
    - Within category, sort by number of saves

[] Style nav bar with bootstrap (see bookmarked link)

[] Do I need these in my whitelisted params since I'm not using checkboxes anymore?
    :recipe_ingredients_ids
    :recipe_steps_ids

Stretch!
[] Search function searches recipe ingredients in addition to name

[] Sort recipes alphabetically OR by popularity

[] Adjust URL's for slug: /categories/chicken/recipes, rather than /categories/1/recipes

[] Error messages if new recipe reloads - including specific error on ingredient

[] Comment form on recipe show page

[] Add comments to recipe's show page and/or to user's recipe box




Old HTML from application.html.erb
    <div class="nav">
      <% if user_signed_in? %>
        <%= link_to "My Recipe Box", saved_recipes_path %><br>
        <%= link_to "Recipe Index", recipes_path %><br>
        <%= link_to "Log Out", destroy_user_session_path, method: :delete %><br>
        <%= link_to "Create a Recipe", recipes_new_path %><br>
      <% else %>
        <%= link_to "Recipe Index", recipes_path %><br>
        <%= link_to "Log In", new_user_session_path %><br>
        <%= link_to "Sign Up", new_user_registration_path %><br>
      <% end %>
    </div>
