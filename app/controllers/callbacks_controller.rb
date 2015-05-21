class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def self.find_for_google_oauth2(access_token, _signed_in_resource = nil)
    data = access_token.info
    user = User.find_by email: (data['email'])

    #	    Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20]
                        )
    end
    user
  end
end
