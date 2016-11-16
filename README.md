# README
  A step by step command guide:

## Creating DDBBs

* `rails g model User name:string email:string`
* `rails g model Product title:string description:string deadline:date`
* `rails g migration add_users_to_products user:references`
* `rails db:migrate`

## Relations between DDBBs (1-M)

In the models set it up:

* `belongs_to :user`
* `has_many :products`

## Create seeds

```Ruby
def time_rand from = Time.now - 1.day, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

i=0
10.times do
    user_name = "user"+i.to_s
    user = User.create(name: user_name, email: user_name+"@gmail.com")
    j=0
    5.times do
      user.products.create(title: "title"+j.to_s, description: "description blabla", deadline: time_rand)
      j+=1
    end
i+=1
end
```

## Create controller & views

* `rails g controller products`
* `rails g controller useres`

* method & view `index` para mostrarlos todos
* method & view `show` para mostrar detalles de uno
* method & view `new` para ver form donde crear uno
* method `create` donde hacer post para crear elemento (la ruta misma que index pero en `post`)

* Creando una ruta (para ver todos los users, es decrir, la index)
  * `get '/users', to: 'users#index'`
  * en el metodo index del controlador users cargamos los users `@users = User.all`
  * renderizamos en la vista todos los `name` con un bucle

  ``` html

  <% @users.each do |user| %>
    <li><a href="#"><%= user.name %></a></li>
  <% end %>

  ```

## forms en new

* Ruta en el router `get '/users/new', to: 'users#new'`
* en el method `new` creamos una instancia para que nos lo coja el `form` _rails way_
`@user = User.new`
* Creamos el form basico

``` html

<%= form_for @user do |f| %>
  <%= f.label :name %>
  <%= f.text_field :name %>

  <%= f.label :email %>
  <%= f.email_field :email %>

  <%= f.button "send" %>
<% end %>

```

* ruta post en `router.rb` : `post '/users', to: 'users#create'`

* Creamos elemento en el metodo `create` del controller:

  ```Ruby
  def create
    user = User.new(
      name: params[:user][:name],
      email: params[:user][:email]
    )
    render "error" unless user.save
    redirect_to "/users"
  end
  ```
## validaciones

* Email unico: En el modelo users:
  `validates :email, uniqueness: true`  

## Deleting

* with `link_to`:
  * in show view:
  `<%= link_to "Delete", "/users/#{@user.id.to_s}/delete" , method: :delete %>`
  * in router.rb:
  `delete '/users/:id/delete', to: 'users#destroy'`
  * in destroy method:
  ```Ruby
  User.find(params[:id]).destroy
  redirect_to "/users"
  ```

