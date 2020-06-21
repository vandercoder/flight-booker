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
airline, departing_id, departure_time, boarding_time, 
arrival_id, arrival_time, flight_time, stops, gate

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

