class ResultsController < ApplicationController
  def index
    @products = Product.search_everywhere(params[:query])
  end
end
