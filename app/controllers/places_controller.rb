class PlacesController < ApplicationController
  def index
  end

  def search
  	session[:city] = params[:city];
		@places = BeermappingApi.fetch_places_in(params[:city])

		if @places.empty?
			redirect_to places_path, notice: "No locations in #{params[:city]}"
		else
			render :index
  	end
	end

  def show
    @places = BeermappingApi.fetch_places_in(session[:city])
    puts "len: #{@places.length}"
       puts "len: #{params[:id]}"
    @place = @places[Integer(params[:id])-1]
    puts "place: #{@place.name}"

   end
end
