class SiteController < ApplicationController
  before_action :authenticate_user!, only: :shared

  def index
    if user_signed_in?
      @list = List.new
      @lists = List.all
    end
  end
end
