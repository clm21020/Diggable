module Api
  class ListingsController < ApiController
    def index
      @listings = Listing.search_results(params)
      render json: @listings
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
      params.require(:listing).permit(:price, :listing_type, :street_1, :street_2, :city, :state, :zip_code, :description, :available_at)
    end
  end
end
