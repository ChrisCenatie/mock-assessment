class LinksController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate

  def index
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    if link.save
      current_user.links << link
      flash[:notice] = ["Link Successfully Created!"]
      redirect_to links_path
    else
      flash[:errors] = link.errors.full_messages
      redirect_to links_path
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def update
    link = Link.update(params[:id], link_params)
    if link.valid?
      flash[:notice] = ["Link Successfully Updated!"]
      redirect_to links_path
    else
      flash[:errors] = link.errors.full_messages
      redirect_to "/links/#{params[:id]}"
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :title)
    end
end
