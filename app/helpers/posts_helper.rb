module PostsHelper
  def create_post
    key = ENV['WEATHER_API_KEY']
    weather_response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{params[:lat].to_f}&lon=#{params[:lon].to_f}&appid=#{key}")
    create_new_post(weather_response)
  end

  def create_post_by_ip
    key = ENV['WEATHER_API_KEY']
    city = find_city
    if city
      weather_response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{key}")
      return create_new_post(weather_response)
    else
      return create_post_without_city
    end
  end

  def find_city
    query = HTTParty.get("http://api.ipstack.com/#{params[:ip]}?access_key=#{ENV['IPSTACK_KEY']}")
    return query['city'] if query['city']
    return query['region_name'] if query['region_name']
  end

  def create_new_post(response)
    Post.new(
      temp: response['main']['temp'].to_i,
      city: response['name'],
      country: response['sys']['country'],
      lon: response['coord']['lon'],
      lat: response['coord']['lat'],
      weather_brief: response['weather'][0]['main'],
      weather_description: response['weather'][0]['description'],
      content: params[:content],
      user_id: session[:user_id]
    )
  end

  def create_post_without_city
    Post.new(
      content: params[:content],
      user_id: session[:user_id]
    )
  end
end
