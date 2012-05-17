module AnyGood
  class Movie
    attr_accessor :name, :ratings, :info

    def initialize(attributes = {})
      attributes.each do |k, v|
        send "#{k}=", v
      end
    end

    def combined_rating
      @ratings.inject(:+) / @ratings.length
    end

    def to_json
      {
        name: @name.sub(/\+/, ' '),
        info: @info,
        ratings: @ratings,
        combined_rating: combined_rating
      }.to_json
    end
  end
end