class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  end

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)
    @user.persisted? ? login_and_redirect : register_new_user
  end

  def login_and_redirect
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
    sign_in_and_redirect @user, event: :authentication
  end

  def register_new_user
    session['devise.google_data'] = request.env['omniauth.auth']
    redirect_to new_user_registration_url
  end
end
