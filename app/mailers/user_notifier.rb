class UserNotifier < ActionMailer::Base
  default :from => 'support@whatpicisit.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app!' )
  end
  def send_invite(email, current_user, myname)
  	@email = email
  	@myemail = current_user
  	@myname = myname
  	mail( :to => @email, 
  		:subject => 'Check out this cool new app!', :from => @myemail)
  end
end