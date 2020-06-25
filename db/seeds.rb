# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = Airport.create([
    { code: 'CGK', name: 'Soekarno-Hatta International Airport', city: 'Jakarta', country: 'Indonesia', timezone: "Jakarta" },
    { code: 'JOG', name: 'Adisutjipto International Airport', city: 'Yogyakarta', country: 'Indonesia', timezone: "Jakarta"},
])

flights = Flight.create ([
    { airline: 'William Airlines', departure_id: 1, arrival_id: 2, departure_datetime: '2020-07-05 07:00:00', duration: 4500, stops: 0 },
    { airline: 'William Airlines', departure_id: 2, arrival_id: 1, departure_datetime: '2020-07-05 12:00:00', duration: 3600, stops: 0 },
    { airline: 'Batik Air', departure_id: 1, arrival_id: 2, departure_datetime: '2020-07-06 08:00:00', duration: 4500, stops: 0 }
])