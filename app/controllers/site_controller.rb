class SiteController < ApplicationController

  def index
    if logged_in?
      @list = List.new
      @lists = List.all
    end
  end

end
