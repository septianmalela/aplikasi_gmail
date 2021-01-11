class EmailUsersController < ApplicationController
  before_action :authenticate_user!
  helper_method :inbox
  skip_before_action :verify_authenticity_token
  
  def index
  	@emails = current_user.email_users.inbox
  end

  def show
    @emails = EmailUser.find(params[:id])
    @email = @emails.email
    @user = @email.user
    @post_attachments = @email.post_attachments.all
  end

  def destroy
    @emails = EmailUser.find(params[:id])
    @emails.update_attribute(:status, "trash")

    flash[:notice] = "Email Move To Trash"
    redirect_to root_path
  end

end
