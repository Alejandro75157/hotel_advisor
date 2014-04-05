class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.rating.build
  end

  # POST /comments
  # POST /comments.json
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @comment = @hotel.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        flash[:success] = 'Comment was successfully created.'
        format.html { redirect_to @hotel }
      else
        flash[:error] = 'Failed to create comment.'
        format.html { redirect_to @hotel }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to hotel_path(params[:hotel_id]) }
      format.json { head :no_content }
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :hotel_id, :body, rating_attributes: [:score])
  end
end
