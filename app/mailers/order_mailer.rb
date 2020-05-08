class OrderMailer < ApplicationMailer

  def new_order
    @order = params[:order]
    @url = 'http://localhost:3000/orders'
    mail(
      to: [@order.user.email, 'ninjarendan@gmail.com'],
      subject: 'Новый заказ|Angar.kh.ua'
    )
  end

  def cancel_order
    @order = params[:order]
    @url = 'http://localhost:3000/orders'
    mail(
      to: [@order.user.email, 'ninjarendan@gmail.com'],
      subject: 'Заказ отменен|Angar.kh.ua'
    )
  end
  
end
