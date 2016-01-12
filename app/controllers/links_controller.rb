class LinksController < ApplicationController
  before_action :authenticate

  def index
    @links = current_user.links
  end

  def create
    link = Link.new(link_params)
    if link.save
      current_user.links << link
      flash[:notice] = "Link Successfully Created!"
      redirect_to links_path
    else
      flash[:errors] = link.errors.full_messages
      redirect_to links_path
    end
  end

  private

    def link_params
      params.require(:link).permit(:url, :title)
    end
end
