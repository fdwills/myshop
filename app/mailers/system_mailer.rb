class SystemMailer < ActionMailer::Base
  default from: "system@shop.fdwills.com"

  def rate_batch_email(user, rate)
    @user = user
    @rate = rate
    mail(to: @user.email, subject: 'Rate Update Successfully')
  end

  def rate_batch_fault_email(user)
    mail(to: @user.email, subject: 'Rate Update Failed')
  end
end
