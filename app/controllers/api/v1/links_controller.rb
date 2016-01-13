class Api::V1::LinksController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def update
    if current_user.links.include?(Link.find(params[:id]))
      respond_with Link.update(params[:id], link_params)
    else
      respond_with status: :unauthorized
    end
  end

  private

    def link_params
      params.require(:link).permit(:read_status)
    end
end
