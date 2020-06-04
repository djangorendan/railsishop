class ProductsController < ApplicationController
  # GET /products/1
  # GET /products/1.json

  layout "etc"

  before_action :authenticate_user!, only: [
    :create_product_comment
  ]

  before_action :set_comment, only: [
    :like_comment,
    :dislike_comment
  ]

  before_action :set_working_hours, only: :show

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

  def set_working_hours
    @late_delivery_time = Time.zone.parse "16:00"
    if Date.today.wday == 0 || Date.today.wday == 6
      @today_open_time = Time.zone.parse "10:00"
      @today_close_time = Time.zone.parse "17:00"
    else
      @today_open_time = Time.zone.parse "09:00"
      @today_close_time = Time.zone.parse "21:00"
    end
    if Date.today.wday == 5
      @tomorrow_open_time = Time.zone.parse "10:00"
    elsif Date.today.wday == 0
      @tomorrow_open_time = Time.zone.parse "09:00"
    else
      @tomorrow_open_time = @today_open_time
    end
    @today_open_time = @today_open_time.strftime("%H:%M")
    @today_close_time = @today_close_time.strftime("%H:%M")
    @tomorrow_open_time = @tomorrow_open_time.strftime("%H:%M")
  end

  private
    def set_comment
      @comment = ProductComment.find(params[:comment_id])
    end
end
