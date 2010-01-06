class User < ActiveRecord::Base
  acts_as_authentic
  validates_presence_of :first_name, :last_name
  belongs_to :company
  accepts_nested_attributes_for :company, :allow_destroy => true

  def deliver_password_reset_instructions!  
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  def deliver_member_invitation!  
    reset_perishable_token!
    Notifier.deliver_member_invitation(self)  
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def assign_random_password
    @password = ActiveSupport::SecureRandom.base64(12)
    @password_confirmation = @password
  end
  
  def pending?
    last_request_at.nil?
  end
end
