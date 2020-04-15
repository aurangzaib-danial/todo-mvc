class SiteController < ApplicationController
  def index
    if user_signed_in?
      @list = List.new
      @lists = List.all
    end
  end
end
