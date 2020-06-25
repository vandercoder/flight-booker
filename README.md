# Flight Booker 

### Pages
    1. Homepage
    2. Search Flight
    3. Booking Detail / Passenger Form(s) 

### User flow
> User opens airline homepage
> User clicks 'Search Flight' button
> User navigates to search flight page
> User fills form
    > From and To (City)
    > Number of Passengers
    > Date
> Site updates page with flight search results with details
> User picks desired flight
> User clicks 'Book Flight' button
> User navigates to Booking Detail page
> User fills passenger form(s) with first name, last name, and email
> User clicks 'Confirm Booking' button
> Site updates booking page with passenger detail, with 'view ticket' option


### Initial Model Layout
#### Table Design
flight:
airline, departure_id, arrival_id, flight_time, stops, gate

airport:
airport_name, airport_code, city, country, latitude, longitude, timezone

passenger
first_name, last_name, email

booking
flight_id, passenger_id


#### Model Association Design
```ruby
class Flight < ActiveRecord::Base
    belongs_to :origin, class_name: "Airport", primary_key: "code"
    belongs_to :destination, class_name: "Airport", primary_key: "code"
    has_many :bookings
    has_many :passengers, through: :bookings

class Airport < ActiveRecord::Base
    has_many :departures, class_name: "Flight", foreign_key: "origin_id"
    has_many :arrivals, class_name: "Flight", foreign_key: "destination_id"

class Booking < ActiveRecord::Base
    belongs_to :flight
    has_many :passengers
    accepts_nested_attributes_for :passengers

class Passenger < ActiveRecord::Base
    belongs_to :booking
    has_many :flights, through: :booking
    self.primary_key: "code"

```

### Thoughts
Initially, this project instructs you to use a new primary key for your Flight-Airport association. 
Namely airports should be identified by its 'code' instead of Rails' default id. But after some 
research, I find that people don't really recommend this since it goes against Rails' principles
https://stackoverflow.com/questions/750413/altering-the-primary-key-in-rails-to-be-a-string

Decided to try out bootstrap for css in this framework. Right off the bat, i ran into trouble with
navbar overlays https://stackoverflow.com/questions/10336194/top-nav-bar-blocking-top-content-of-the-page

Gave a try on simple-forms since everyone in rails seems to recommend it. But i couldn't get it to work
for my search form just yet, so I switched back to vanilla by using form_for or form_with

Stumble upon elasticsearch when i was trying to build a search form. 

I was confused about how to store durations on a database. Tried to use the time dataype but when I try to
input "01:15:00" it adds a date upfront for some reason(?). In any case, I found a solution to instead store 
time only as seconds and store it as an integer. Then you can perform calculations on it if you want to show 
into hours and minutes. This way it is supposed to be faster.
https://stackoverflow.com/questions/1051465/using-a-duration-field-in-a-rails-model

Got into the datetime problem. It really is harder than it looks. I try not to handle timezones at
the moment. Ran into some trouble with date handling. Turns out it's a lot of hassle handling datetime
variables, especially if you only ever need to call one (the date or time). Better to 
just store them separately, flight_date and flight_time. actually no ended up using datetime
seems i need to make use more model callbacks

# HOW TO SHOW RESULTS