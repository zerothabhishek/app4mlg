
job "account.verify" do |args|
  id = args['account_id'].to_i
  account = Account.find(id)
  account.verify_it
end