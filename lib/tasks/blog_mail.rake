namespace :blog_mail do

  desc "TODO"
  task daily_digest: :environment do
    if Time.now.monday?
      ApplicationMailer.weekly_digest
    end
    ApplicationMailer.daily_digest
  end

end
