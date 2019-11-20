rails db:environment:set RAILS_ENV=development

rails db:drop db:create

rails db:migrate

rails g scaffold User name email password_digest

rails g scaffold UserProfile \
    ex_email:string \
    first_name:string \
    last_name:string \
    username:string

rails g scaffold CruiseLine \
    name:string

rails g scaffold Ship \
    name:string \
    cruise_line:references

rails g scaffold ShipImage \
    url:string \
    ship:references

rails g scaffold Review \
    body:text \
    rating:integer \
    user_profile:references \
    ship:references 

rails g scaffold Comment \
    body:text \
    user_profile:references \
    review:references

rails g scaffold Helpful \
    user_profile:references \
    review:references

rails g scaffold Region \
    name:string \
    description:text

rails g scaffold Port \
    name:string

rails g scaffold Voyage \
    start:datetime \
    end:datetime \
    region:references

rails g scaffold voyage_port port:references voyage:references

rails g scaffold Itinerary \
    name:string \
    ship:references \
    voyage_port:references

rails g scaffold PortImage \
    url:string \
    port:references

rails db:migrate
