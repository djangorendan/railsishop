class ResultsController < ApplicationController
  def index
    @products = Product.search_everywhere(params[:query]).page params[:page]
  end
end
