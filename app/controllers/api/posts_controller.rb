class Api::PostsController < ApplicationController
  before_action :authenticate_user

  def index
    @posts = current_user.posts
    render "index.json.jbuilder"
  end

  def create
    post = Post.new(
      photo: params[:photo],
      location: params[:location],
      description: params[:description],
      user_id: current_user.id, 
      trip_id: params[:trip_id]
    )
    if post.save
      render json: {message: 'Post created successfully'}, status: :created
    else
      render json: {errors: post.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.photo = params["photo"] || @post.photo
    @post.location = params["location"] || @post.location
    @post.description = params["description"] || @post.description
    @post.trip_id = params["trip_id"] || @post.trip_id
  
    if @post.save
      render "show.json.jbuilder"
    else
      render json: {error: @post.errors.full_messages}, status: 404
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: {message: "Your post has been deleted."}
  end

end
