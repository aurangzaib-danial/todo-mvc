class SiteController < ApplicationController
  def index
    @list = List.new if user_signed_in?
  end
end
