class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
  	@comments = Comment.all
  end

  def show
  	@comment = Comment.find(params[:id])
  end

end
