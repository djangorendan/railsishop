class ProductsController < ApplicationController
  # GET /products/1
  # GET /products/1.json

  before_action :authenticate_user!, only: [
    :create_product_comment
  ]

  before_action :set_comment, only: [
    :like_comment,
    :dislike_comment
  ]

  def show
    @product = Product.friendly.find(params[:id])
    @product.increment!(:views)
    @products = Product.displayed.where(category: @product.category)
      .where("price >= ?", @product.price-1000).where("price <= ?", @product.price+1000)
      .where.not(id: @product.id).page params[:page]
  end

  def create_product_comment
    product = Product.find(params[:product_id])
    product.product_comments.create(
      user_id: current_user.id,
      like: 0,
      comment: params[:comment]
    )
    respond_to do |format|
      format.html { redirect_to product }
    end
  end

  def like_comment
    @comment.increment!(:like)
    respond_to do |format|
      format.js
    end
  end

  def dislike_comment
    @comment.decrement!(:like)
    respond_to do |format|
      format.js
    end
  end

  private
    def set_comment
      @comment = ProductComment.find(params[:comment_id])
    end
end
