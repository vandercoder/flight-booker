class FlightsController < ApplicationController
    def index
       @airport_options = Airport.all.map{ |a| [a.city, a.id] }
       @date_options = Flight.available_dates

       search_flights if params[:commit]
    end

    def search_flights
      if params[:departure] == params[:arrival]
        flash.now[:alert] = "Please choose different departure and arrival cities."
      elsif
        params[:departure_date].empty?
        # return all available flights (all dates)
        @results = Flight.where(
          "origin_id = ? AND destination_id = ?", params[:departure], params[:arrival]
        )
      else
        date = Date.parse(params[:departure_date])
        date_begin = date.beginning_of_day
        date_end = date.end_of_day

        @results = Flight.where(
          "departure_id = ? AND arrival_id = ? AND departure_datetime > ? AND departure_datetime < ?",
          params[:departure], params[:arrival], date_begin, date_end
        )
        @date_param = date
      end
    end

end
