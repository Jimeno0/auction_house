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

## Create controllers

* `rails g controller products`
* `rails g controller useres`
