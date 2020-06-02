class CommentsController < ApplicationController
  def index
    @photo = Comment.find(params[:photo_id])
    comments = Comment.all
  end

  def new
    @photo = Comment.find(params[:photo_id])
    @comment = @photo.comments.new
  end

  def create
    @photo = Comment.find([:photo_id])
    @comment = @photo.comments.new(comment_params)
    if @comment.save
      redirect_to photo_path(@comment.photo)
    else
      render :new
    end
  end

 def show
  @photo = Comment.find(params[:photo_id])
  render "photos/show"
 end

  def edit
    @comment = Comment.find(params[:id])
    @photo = Comment.find(params[:photo_id])
    render :edit
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to photo_comment_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to photo_path(@comment.photo)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :photo_id)
  end
end
