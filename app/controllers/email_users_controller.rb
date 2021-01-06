class EmailUsersController < ApplicationController
  before_action :authenticate_user!
  helper_method :inbox
  skip_before_action :verify_authenticity_token
  
  def index
  	@emails = EmailUser.where(recipients: current_user.email).where(status: 'inbox')
  end

  def show
    # @email = Email.joins(:post_attachments).select("emails.*, post_attachments.*")
    # @emails = User.joins(emails: :email_users).select("emails.*, users.*, email_users.*").find(params[:id])
    # @emails = Email.joins(:email_users).select("emails.*,email_users.*")
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
