class Api::ListingsController < ApplicationController
 #before_action :set_listing, only: [:show, :edit, :update, :destroy]
 #before_filter :authenticate_user!, only: [:seller, :new, :create, :edit, :update, :destroy]
#before_filter :check_user, only: [:edit, :update, :destroy]

protect_from_forgery with: :null_session
respond_to :json


  def seller
    @listings = Listing.where(user: current_user).order("created_at DESC")

  end



def index
    @listings = Listing.all.order("created_at DESC")

  end


def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end


def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end









  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id


    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
 


 def destroy 
 @listing.destroy
 respond_to do |format|
  format.html { redirect_to listings_url}
  format.json { head :no_content}
 end
end











  private

  def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:name, :description, :price, :image)
    end


def check_user
      if current_user != @listing.user
        redirect_to root_url, alert: "Sorry, this listing belongs to someone else"
      end
    end
end



