module PostsHelper

  def create_post
    key = ENV['WEATHER_API_KEY']
    weather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{params[:lat].to_f}&lon=#{params[:lon].to_f}&appid=#{key}")
    response = {
      temp: weather['main']['temp'].to_i,
      city: weather['name'],
      country: weather['sys']['country'],
      lon: weather['coord']['lon'],
      lat: weather['coord']['lat'],
      weather_brief: weather['weather'][0]['main'],
      weather_description: weather['weather'][0]['description'],
      content: params[:content],
      user_id: session[:user_id]
    }
  end

  def get_current_time

  end
end
