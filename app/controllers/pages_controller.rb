class PagesController < ApplicationController
  def home
    @categories = Vehicle::CATEGORIES
  end
end
