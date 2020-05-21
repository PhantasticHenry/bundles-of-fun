Specs:

[x] - Using Ruby on Rails for the project
[x] - Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) # A user has_many purchase orders
[x] - Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) # A purchase order belongs to a user
[x] - Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) # A product has_many materials through product material, a material has_many product through product material.
[x] - Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) # A product has_many materials through product material, a material has_many product through product material.
[x] - The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) # The through part of the has_many has an attribute (quantity) that is submittable by a user.
[x] - Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) # User, Name, Email, Password
[x] - Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) # localhost:3000/purchase_order/1/po_products
[x] - Include signup # localhost:3000/signup
[x] - Include login # localhost:3000/login
[x] - Include logout # localhost:3000/logout
[x] - Include third party signup/login (how e.g. Devise/OmniAuth) # ability to signup/login through facebook and google
[x] - Include nested resource show or index (URL e.g. users/2/recipes) # purchase_order/1/po_products
[x] - Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) # purchase_order/1/po_products/new
[x] - Include form display of validation errors (form URL e.g. /recipes/new) # presence: true

Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate