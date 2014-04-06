class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :show, :edit, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all.sort_by  { |hotel| -hotel.id}
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])
    @comments = Comment.where hotel: @hotel
    @comments.sort_by  { |comment| -comment.id}
    @new_comment = Comment.new hotel: @hotel
    @new_comment.build_rating
    @current_user_id = current_user.id
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @hotel.addresses.build
  end

  # GET /hotels/1/edit
  def edit

  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.user = current_user


    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel}
        format.json { render action: 'show', status: :created, location: @hotel }
      else
        format.html { render action: 'new' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_params
      params.require(:hotel).permit(:title, :breakfast_included, :room_description, :image, :user_id,
                                    :price_for_room, addresses_attributes: [:country, :state, :city, :street, :hotel_id])
    end

    # def address_params
    #  params.require(:hotel).require(:addresses).permit(:country, :state, :city, :street)
    # end
end
