class Api::SessionsController < ApplicationController
  
  include SessionsHelper

  def save_location_by_gps
    session[:gps_location] = {lat: params[:lat], lon: params[:lon]}
    render json: session[:gps_location]
  end
end