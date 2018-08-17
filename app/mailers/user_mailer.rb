class UserMailer < ApplicationMailer

default from: 'no-reply@jungle.com'

  def welcome_email(order)
     @order = order
     mail(to: @order.email, subject: "Order confirmation ##{@order.id}")
     puts "email sent"
  end
end
