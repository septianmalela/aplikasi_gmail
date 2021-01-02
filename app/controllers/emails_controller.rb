class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trash, only: [:move_trash]
  skip_before_action :verify_authenticity_token
  before_action :set_delete, only: [:delete_draft]

  def index
    @email = current_user.emails.inbox
  end

  def draft
    @draft = current_user.emails.draft
  end

  def trash
    @trash = current_user.emails.trash
  end

  def sent
    @sent = current_user.emails.sent
  end

  def new
    @email = Email.new
    @post_attachment = @email.post_attachments.build
    @emailusers = @email.email_users.build
  end

  def create
    byebug
    @email = Email.new(email_params)
    @email.user = current_user
    @email.status = params[:commit]
    
     if @email.save
      if (@email.status == 'sent' && User.exists?( email: @email.recipients ))

         params[:post_attachments]['attachment'].each do |a|
            @post_attachment = @email.post_attachments.create!(:attachment => a, :email_id => @email.id)
         end

         @emailusers = @email.email_users.create!(:email_id => @email.id, :subject => @email.subject )
         
         flash[:notice] = "Anda Berhasil Mengirim Email Ke '#{@email.recipients}' "
         redirect_to root_path
       else
        flash[:notice] = "Email Masuk Ke Draft"
        @email.update_attribute(:status, "draft")
        redirect_to draft_emails_path
      end
     else
         flash[:notice] = "Email yang dituju tidak ada!!"
         @email.delete
         redirect_to root_path
     end

  end

  def move_trash
    emails = Email.friendly.find(params[:id])
    emails.update_attribute(:status, "trash")

    if emails.save
      redirect_to trash_emails_path
      flash[:notice] = "Move to Trash Message '#{emails.subject}' "
    else
      redirect_to 'new'
    end
  end

  def edit
    @email = Email.friendly.find(params[:id])
  end

  def update
    @email = Email.friendly.find(params[:id])
      @email.update(resource_params)
      @email.update(status: 'sent')
      params[:post_attachments]['attachment'].each do |a|
          @post_attachment = @email.post_attachments.create!(:attachment => a, :email_id => @email.id)
        end
      flash[:notice] = "Update Draft Succes, Email sent to '#{@email.recipients}' "

      redirect_to root_path
  end

  def delete_trash
    email = Email.friendly.find(params[:id])
    email.update_attribute(:status, "delete")

    if email.save
      redirect_to trash_emails_path
      flash[:notice] = "Delete Message '#{email.subject}' "
    else
      redirect_to trash_emails_path
    end
  end

  private

  def email_params
    params.require(:email).permit(:recipients, :subject, :message, post_attachments_attributes: 
  [:id, :email_id, :attachment], email_users_attributes: [:id, :email_id, :subject])
  end

  def set_trash
    @email = Email.find_by_id(params[:id])
  end

  def delete_draft
    @email = Email.find_by_id(params[:id])
  end

end