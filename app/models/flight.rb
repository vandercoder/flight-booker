class Flight < ApplicationRecord
    belongs_to :departure, class_name: "Airport"
    belongs_to :arrival, class_name: "Airport"

    #apply callback methods
    def departure_time
        format_time(departure_datetime, departure.timezone)
    end

    def departure_date
        departure_datetime.strftime("%d %b %Y")
    end

    def arrival_datetime
        departure_datetime + duration.seconds
    end

    def arrival_date
        arrival_datetime.strftime("%d %b %Y")
    end

    def arrival_time
        format_time(arrival_datetime, arrival.timezone)
    end

    def duration_mins
        duration / 60
    end

    def flight_time
        "#{(duration_mins - (duration_mins % 60)) / 60} hrs #{duration_mins % 60} mins"
    end

    def self.available_dates
        flights = Flight.all.order(departure_date: :asc)
        flights.map { |f| f.departure_datetime.strftime('%d %b %Y') }.uniq
    end


    private

        def format_time(time, timezone)
            time.in_time_zone(timezone).strftime("%I:%M %p")
        end

end