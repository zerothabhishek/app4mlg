class Account < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :address, :email
  after_create :inform_Q
  
  def inform_Q
    p "hi"
    #Stalker.enqueue("account.verify", :account_id => self.id)
  end
  
  def verify_it
    update_attribute(:verified, :true)
  end
  
end
