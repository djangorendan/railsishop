class OrderMailer < ApplicationMailer
  default from: 'ninjarendan@google.com'

  def new_order
    @order = params[:order]
    @url = 'http://localhost:3000/'
    mail(to: @order.user.email, subject: 'new_order')
  end

  def new_order_admin
    @order = params[:order]
    @url = 'http://localhost:3000/'
    mail(to: 'ninjarendan@gmail.com', subject: 'new_order')
  end

  def cancel_order
    @order = params[:order]
    @url = 'http://localhost:3000/'
    mail(to: @order.user.email, subject: 'cancel_order')
  end
end
