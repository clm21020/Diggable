module API
  class ListingsController < ApiController
    def index
      @listings = Listing.search_results({})
      render json: @boards
    end

    def show
      @listing = Listing.find(params[:id])
      render json: @listing
    end

    def create
      @listing = current_user.listings.new(listing_params)

      if @listing.save
        render json: @listing
      else
        render @listings.errors.full_messages, status: :unprocessable_entity
      end
    end

    private
    def listing_params
      params.require(:listing).permit(:price, :category, :street_1, :street_2, :city, :state, :zip_code, :description, :available_at)
      # get latitude and longitude from Google Maps/geocoder
    end
  end
end
