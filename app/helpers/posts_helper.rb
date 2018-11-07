module PostsHelper
  def create_post
    create_new_post(call_weather_api_with_lat_lon)
  end

  def create_post_by_ip
    city = find_city    
    if city
      return create_new_post(call_weather_api_with_ip)
    else
      return create_post_without_city
    end
  end

  def find_city
    query = find_city_with_ip
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

  def get_next_10_posts
    Post.where(user: params[:id]).order('created_at desc').limit(10).offset(params[:offset])
  end

  def call_weather_api_with_lat_lon
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?lat=#{params[:lat].to_f}&lon=#{params[:lon].to_f}&appid=#{ENV['WEATHER_API_KEY']}")
  end

  def find_city_with_ip
    HTTParty.get("http://api.ipstack.com/#{params[:ip]}?access_key=#{ENV['IPSTACK_KEY']}")
  end
  
  def call_weather_api_with_ip
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{find_city}&appid=#{ENV['WEATHER_API_KEY']}")
  end
end
