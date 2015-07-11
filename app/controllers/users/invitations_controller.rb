class Users::InvitationsController < Devise::InvitationsController
  before_filter :configure_invite_params, only: [:create]
  before_filter :configure_accept_invitation_params, only: [:update]

  # GET /resource/invitation/new
  # def new
  #   super
  # end

  # POST /resource/invitation
  # def create
  #   super
  # end

  # GET /resource/invitation/accept?invitation_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/invitation
  # def update
  #   super
  # end

  # DELETE /resource/invitation/remove?invitation_token=abcdef
  # def destroy
  #   super
  # end

  protected

  # You can put the params you want to permit in the empty array.
  def configure_invite_params
    devise_parameter_sanitizer.for(:invite) << [:email]
  end

  # You can put the params you want to permit in the empty array.
  def configure_accept_invitation_params
    devise_parameter_sanitizer.for(:accept_invitation) << [:email, :username, :profile_attributes => [:first_name, :last_name, :bio]]
  end

end
