class Notifier < ActionMailer::Base  
  default_url_options[:host] = "localhost"  
  default_url_options[:port] = 3000

  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "oliver@opsb.co.uk"  
    recipients    user.email  
    sent_on       Time.now  
    body          :reset_url => edit_password_reset_url(user.perishable_token)  
  end
  
  def member_invitation(user)  
    subject       "Invitation to Informa at conference hub"  
    from          "oliver@opsb.co.uk"  
    recipients    user.email  
    sent_on       Time.now  
    body          :reset_url => edit_password_reset_url(user.perishable_token)  
  end
end