require 'test_helper'

class BackgroundJobFlowTest < ActionDispatch::IntegrationTest

  #
  #  Tests the interaction between the rails application and the background queue - the insert part. 
  #  When the rails application sends a job to the background process, it should exists in the queue
  #
  test "on account.inform_Q, a verification job should be inserted to the background queue" do
    account = Account.new(:first_name => "abhi", :last_name => 'yadav', 
                          :address => "some address", :email => "e@example.com")
    jid = account.inform_Q
    bs = Beanstalk::Pool.new(['localhost:11300'])
    job_exists = !bs.peek_job(jid).empty?
    assert job_exists
  end
  
end
