class ResultsController < ApplicationController
  def index
    @search_results = Product.search_everywhere(params[:query])
  end
end
