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

  def create_post_by_ip
    key = ENV['WEATHER_API_KEY']
    weather = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{(find_city)['city']}&appid=#{key}")
  end

  def find_city
    HTTPARTY.get("http://api.ipstack.com/#{request.remote_ip}?access_key#{ENV['IPSTACK_KEY']}"
  end
end
