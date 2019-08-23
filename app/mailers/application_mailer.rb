class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def daily_digest
    @url = 'http://example.com/login'
    User.where(:digest_frequency => 'daily').each do |user|
      mail(to: user.email, subject: 'Welcome to My Awesome Site')
    end
  end

  def weekly_digest
    @url = 'http://example.com/login'
    User.where(:digest_frequency => 'weekly').each do |user|
      mail(to: user.email, subject: 'Welcome to My Awesome Site')
    end
  end

end
