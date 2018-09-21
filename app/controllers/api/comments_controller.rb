class Api::CommentsController < ApplicationController
  before_action :authenticate_user

  def index
    @comments = Comment.all
    render "index.json.jbuilder"
  end

  def create
    comment = Comment.new(
      text: params[:text],
      post_id: params[:post_id],
      user_id: current_user.id
    )
    if comment.save
      render json: {message: 'Comment saved'}, status: :created
    else
      render json: {errors: comment.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @comment = comment.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.text = params["text"] || @comment.text
  
    if @comment.save
      render "show.json.jbuilder"
    else
      render json: {error: @comment.errors.full_messages}, status: 404
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    render json: {message: "Your comment has been deleted."}
  end
end
