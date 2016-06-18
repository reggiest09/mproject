ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'infinite-shore-53816.herokuapp.com',
    :user_name            =>  'demo16frame@gmail.com',
    :password             =>   'Gggggggg',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }

  