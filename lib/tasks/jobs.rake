namespace :stalker do

  desc "starts Stalker, the client for beanstalk, so that jobs are processed in background"
  task :start => :environment do
    job_file = "#{Rails.root}/lib/jobs.rb"
    include Stalker
    require job_file
    Stalker.work
  end
  
end
