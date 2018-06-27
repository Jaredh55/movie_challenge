class Movie
  require 'json'

  def show_all_movies
    movie_list = File.read('../movie_list.json')
    puts movie_list
  end

  def time_to_minutes
    movie_list = File.read('../movie_list.json')
    movie_list.each do |movie|
      @edited_time = movie["time"].gsub(/\r/, " ")
      # hours = edited_time.split(" ")
      p @edited_time
    end
  end

  def create_formatted_hash

    total_theatre_minutes_weekday = 705 # 12 hrs - 15 min
    total_theatre_minutes_weekend = 795 # 13.5 hrs - 15 min

    json_movie_list = File.read('../movie_list.json')
    ruby_movie_list = JSON.parse(json_movie_list)

    ruby_movie_list.each do |movie|
      edited_movie_time = movie["time"].gsub(/\r/, " ")
      edited_movie_time2 = edited_movie_time.split(" ")
      @hours = edited_movie_time2[0].to_i
      @remainder_minutes = edited_movie_time2[2].to_i
      @hours_minutes = @hours * 60
      movie["time"] = @hours_minutes + @remainder_minutes + 35 #including previews and closing times
    end
    
    ruby_movie_list.each do |movie|
      movie["rating"] = movie["rating"].gsub(/\r/, " ")
    end

    ruby_movie_list.each do |movie|
       movie["weekday_runs"] = total_theatre_minutes_weekday / movie["time"].to_i
       movie["weekend_runs"] = total_theatre_minutes_weekend / movie["time"].to_i
    end

  end



  def movie_times
    json_movie_list = File.read('../movie_list.json')
    ruby_movie_list = JSON.parse(json_movie_list)
    @formatted_times = []

    ruby_movie_list.each do |movie|
      edited_movie_time = movie["time"].gsub(/\r/, " ")
      edited_movie_time2 = edited_movie_time.split(" ")
      @hours = edited_movie_time2[0].to_i
      @remainder_minutes = edited_movie_time2[2].to_i
      @hours_minutes = @hours * 60
      @formatted_time = @hours_minutes + @remainder_minutes + 35 #including previews and closing times

      @formatted_times << @formatted_time
    end 

      return @formatted_times
  end

  def movie_titles
    json_movie_list = File.read('../movie_list.json')
    ruby_movie_list = JSON.parse(json_movie_list)

    ruby_movie_list.each do |movie|
      movie_title = movie["title"]
      return movie_title
    end
  end

  def movie_ratings
    json_movie_list = File.read('../movie_list.json')
    ruby_movie_list = JSON.parse(json_movie_list)

    ruby_movie_list.each do |movie|
      @rating = movie["rating"].gsub(/\r/, " ")
      puts @rating
    end
  end

  
end

movie = Movie.new
formatted_arrayofhashes = movie.create_formatted_hash


#creating array of start times
all_start_times = []

formatted_arrayofhashes.each do |movie|
  start_time = 15
  start_times = [15]
  movie["weekday_runs"].times do
    start_time = start_time + movie["time"]
    start_times << start_time
  end
  all_start_times << start_times
end

# p all_start_times

# created array of end times


# p all_start_times.length

all_end_times = []
all_start_times.each do |array_of_start_times|
end_times = []
  array_of_start_times.each do |start_time|
    end_times << start_time - 35

  end
  all_end_times << end_times
end
p all_end_times


# p all_end_times


# total_theatre_minutes_weekday = 705 # 12 hrs - 15 min
# total_theatre_minutes_weekend = 795 # 13.5 hrs - 15 min


# daily_run_count_array = []
# formatted_times_array.each do |movie_time|
#   daily_run_count_array << total_theatre_minutes_weekday / movie_time
# end













#Formatting Time
    # ruby_movie_list.each do |movie|
    #   edited_movie_time = movie["time"].gsub(/\r/, " ")
    #   edited_movie_time2 = edited_movie_time.split(" ")
    #   @hours = edited_movie_time2[0].to_i
    #   @remainder_minutes = edited_movie_time2[2].to_i
    #   @hours_minutes = @hours * 60
    #   @formatted_time = @hours_minutes + @remainder_minutes

    #   p @formatted_time
    # end

    #end of formatting time

#Formatting Title
# ruby_movie_list.each do |movie|
#   movie_title = movie["title"]
#   p movie_title
# end
#end of formatting title

#Formatting Rating
# ruby_movie_list.each do |movie|
#   rating = movie["rating"].gsub(/\r/, " ")
#   p rating
# end
#end of formatting rating

