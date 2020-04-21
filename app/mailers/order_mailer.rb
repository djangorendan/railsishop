class OrderMailer < ApplicationMailer
  default from: 'ninjarendan@google.com'

  def new_order
    @order = params[:order]
    @url = 'http://localhost:3000/orders'
    mail(to: @order.user.email, subject: 'Новый заказ|Angar.kh.ua')
  end

  def new_order_admin
    @order = params[:order]
    @url = 'http://localhost:3000/orders'
    mail(to: 'ninjarendan@gmail.com', subject: 'Новый заказ|Angar.kh.ua')
  end

  def cancel_order
    @order = params[:order]
    @url = 'http://localhost:3000/orders'
    mail(to: @order.user.email, subject: 'Заказ отменен|Angar.kh.ua')
  end

  def cancel_order_admin
    @order = params[:order]
    @url = 'http://localhost:3000/orders'
    mail(to: @order.user.email, subject: 'Заказ отменен|Angar.kh.ua')
  end
end
