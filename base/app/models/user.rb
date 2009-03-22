class User < ActiveRecord::Base
  acts_as_authentic

  def recently_confirmed?
    @recent_confirmation
  end

  def deliver_password_reset!
    reset_perishable_token!
    UserMailer.deliver_reset_password_instructions(self)
  end

  def confirm!
    self.update_attribute(:confirmed, true)
    @recent_confirmation = true
  end

end
