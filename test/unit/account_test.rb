require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  def setup
    @a = accounts(:one)
  end
  
  test "inform_Q should put the job account.verify to Stalker queue" do
    Stalker.expects(:enqueue).with("account.verify", {:account_id => @a.id}).once
    @a.inform_Q
  end

  test "verify_it should set the verified attribute to true" do
    @a.update_attribute(:verified, false)
    @a.verify_it
    assert @a.verified, "verify_it should set the verified attribute to true"
  end
  
end
