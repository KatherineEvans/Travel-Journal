class Api::LikesController < ApplicationController
  before_action :authenticate_user

  def index
    @likes = Like.all
    render "index.json.jbuilder"
  end

  def create
    like = Like.new(
      value: 1,
      post_id: params[:post_id],
      user_id: current_user.id
    )
    if like.save
      render json: {message: 'Like saved'}, status: :created
    else
      render json: {errors: like.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @like = like.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
    render json: {message: "Your like has been deleted."}
  end
end
