# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Email.joins(:email_users).select("emails.*, email_users.*").where(email_users: { status: 'trash'  })
Email.joins(:email_users).where(['email_users.recipients = ? AND email_users.status = ? AND email.status LIKE ?'])
Email.joins("INNER JOIN email_users ON email.id = email_users.user_id").select("email_users.*, emails.*")
Email.joins("INNER JOIN email_users ON email.id = email_users.email_id").where("email.status = ? AND email_users.status = ?", "status", "trash")
#<ActiveRecord::Relation [#<User status: "sent", id: 4, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", user_id: 2, created_at: "2021-01-05 08:18:39.006429000 +0700", updated_at: "2021-01-05 08:18:39.006429000 +0700", slug: nil>
#<User status: "sent", id: 4, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", user_id: 2, created_at: "2021-01-05 08:18:39.006429000 +0700", updated_at: "2021-01-05 08:18:39.006429000 +0700", slug: nil>, 
#<User status: "trash", id: 5, subject: "percobaan kedua", message: "percoban kedua", user_id: 2, created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700", slug: nil>, 
#<User status: "trash", id: 5, subject: "percobaan kedua", message: "percoban kedua", user_id: 2, created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700", slug: nil>, 
#<User status: "trash", id: 6, subject: "percobaan ketiga", message: "percobaan ketiga", user_id: 1, created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700", slug: nil>, 
#<User status: "trash", id: 6, subject: "percobaan ketiga", message: "percobaan ketiga", user_id: 1, created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700", slug: nil>]>

User.joins(emails: :email_users).select(' emails.status, email_users.status, emails.*, email_users.*')
#<User status: "trash", id: 7, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", user_id: 2, created_at: "2021-01-05 08:18:39.026293000 +0700", updated_at: "2021-01-05 09:22:01.283282000 +0700", slug: nil, email_id: 4, recipients: "maulanas430@gmail.com", read: 0>, 
#<User status: "inbox", id: 8, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", user_id: 2, created_at: "2021-01-05 08:18:39.033623000 +0700", updated_at: "2021-01-05 08:18:39.033623000 +0700", slug: nil, email_id: 4, recipients: "urang@gmail.com", read: 0>, 
#<User status: "trash", id: 9, subject: "percobaan kedua", message: "percoban kedua", user_id: 2, created_at: "2021-01-05 08:27:54.045309000 +0700", updated_at: "2021-01-05 09:31:08.123983000 +0700", slug: nil, email_id: 5, recipients: "maulanas430@gmail.com", read: 0>, 
#<User status: "inbox", id: 10, subject: "percobaan kedua", message: "percoban kedua", user_id: 2, created_at: "2021-01-05 08:27:54.057869000 +0700", updated_at: "2021-01-05 08:30:46.153898000 +0700", slug: nil, email_id: 5, recipients: "maulanas430@gmail.com", read: 0>, 
#<User status: "inbox", id: 11, subject: "percobaan ketiga", message: "percobaan ketiga", user_id: 1, created_at: "2021-01-05 08:57:31.025643000 +0700", updated_at: "2021-01-05 08:57:31.025643000 +0700", slug: nil, email_id: 6, recipients: "yusup@gmail.com", read: 0>, 
#<User status: "inbox", id: 12, subject: "percobaan ketiga", message: "percobaan ketiga", user_id: 1, created_at: "2021-01-05 08:57:31.032723000 +0700", updated_at: "2021-01-05 08:57:31.032723000 +0700", slug: nil, email_id: 6, recipients: "yusup@gmail.com", read: 0>]>

User.joins(emails: :email_users).select("emails.id, emails.subject, emails.message, emails.status, email_users.recipients, email_users.status")
#<ActiveRecord::Relation [#<User id: 4, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "trash", recipients: "maulanas430@gmail.com">, 
#<User id: 4, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "inbox", recipients: "urang@gmail.com">, 
#<User id: 5, subject: "percobaan kedua", message: "percoban kedua", status: "trash", recipients: "maulanas430@gmail.com">, 
#<User id: 5, subject: "percobaan kedua", message: "percoban kedua", status: "inbox", recipients: "maulanas430@gmail.com">, 
#<User id: 6, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox", recipients: "yusup@gmail.com">, 
#<User id: 6, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox", recipients: "yusup@gmail.com">]>
Email.joins(:email_users).select("emails.id, emails.subject, emails.message, emails.status, email_users.recipients, email_users.status")
  #<ActiveRecord::Relation [#<Email id: 4, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "trash">,
  #<Email id: 4, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "inbox">,
  #<Email id: 5, subject: "percobaan kedua", message: "percoban kedua", status: "trash">, 
  #<Email id: 5, subject: "percobaan kedua", message: "percoban kedua", status: "inbox">, 
  #<Email id: 6, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox">, 
  #<Email id: 6, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox">]>
EmailUser.joins(email: :email_users).select("emails.id, emails.message, emails.subject, email_users.status, email_users.recipients").where(emails:{status: 'trash'})
#<ActiveRecord::Relation [#<EmailUser id: 6, status: "trash", created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700">, 
#<EmailUser id: 6, status: "trash", created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700">, 
#<EmailUser id: 6, status: "trash", created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700">, 
#<EmailUser id: 6, status: "trash", created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700">, 
#<EmailUser id: 5, status: "trash", created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700">, 
#<EmailUser id: 5, status: "trash", created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700">, 
#<EmailUser id: 5, status: "trash", created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700">, 
#<EmailUser id: 5, status: "trash", created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700">]>

#<User id: 7, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "trash", user_id: 2, created_at: "2021-01-05 08:18:39.026293000 +0700", updated_at: "2021-01-05 09:22:01.283282000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 4, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 8, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "inbox", user_id: 2, created_at: "2021-01-05 08:18:39.033623000 +0700", updated_at: "2021-01-05 08:18:39.033623000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 4, recipients: "urang@gmail.com", read: 0>, 
#<User id: 9, subject: "percobaan kedua", message: "percoban kedua", status: "trash", user_id: 2, created_at: "2021-01-05 08:27:54.045309000 +0700", updated_at: "2021-01-05 09:31:08.123983000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 5, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 10, subject: "percobaan kedua", message: "percoban kedua", status: "inbox", user_id: 2, created_at: "2021-01-05 08:27:54.057869000 +0700", updated_at: "2021-01-05 08:30:46.153898000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 5, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 11, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox", user_id: 1, created_at: "2021-01-05 08:57:31.025643000 +0700", updated_at: "2021-01-05 08:57:31.025643000 +0700", slug: "maulanas-1", email: "maulanas430@gmail.com", name: "maulanas 1", avatar: "2021-01-02-122342.jpg", email_id: 6, recipients: "yusup@gmail.com", read: 0>, 
#<User id: 12, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox", user_id: 1, created_at: "2021-01-05 08:57:31.032723000 +0700", updated_at: "2021-01-05 08:57:31.032723000 +0700", slug: "maulanas-1", email: "maulanas430@gmail.com", name: "maulanas 1", avatar: "2021-01-02-122342.jpg", email_id: 6, recipients: "yusup@gmail.com", read: 0>]>

#<User id: 2, email: "yusup@gmail.com", created_at: "2021-01-04 14:45:11.659488000 +0700", updated_at: "2021-01-04 14:45:11.659488000 +0700", name: "yusup 2", avatar: "2021-01-02-122354.jpg", slug: "yusup-2">, 
#<User id: 2, email: "yusup@gmail.com", created_at: "2021-01-04 14:45:11.659488000 +0700", updated_at: "2021-01-04 14:45:11.659488000 +0700", name: "yusup 2", avatar: "2021-01-02-122354.jpg", slug: "yusup-2">, 
#<User id: 2, email: "yusup@gmail.com", created_at: "2021-01-04 14:45:11.659488000 +0700", updated_at: "2021-01-04 14:45:11.659488000 +0700", name: "yusup 2", avatar: "2021-01-02-122354.jpg", slug: "yusup-2">, 
#<User id: 2, email: "yusup@gmail.com", created_at: "2021-01-04 14:45:11.659488000 +0700", updated_at: "2021-01-04 14:45:11.659488000 +0700", name: "yusup 2", avatar: "2021-01-02-122354.jpg", slug: "yusup-2">, 
#<User id: 2, email: "yusup@gmail.com", created_at: "2021-01-04 14:45:11.659488000 +0700", updated_at: "2021-01-04 14:45:11.659488000 +0700", name: "yusup 2", avatar: "2021-01-02-122354.jpg", slug: "yusup-2">, 
#<User id: 2, email: "yusup@gmail.com", created_at: "2021-01-04 14:45:11.659488000 +0700", updated_at: "2021-01-04 14:45:11.659488000 +0700", name: "yusup 2", avatar: "2021-01-02-122354.jpg", slug: "yusup-2">, 
#<User id: 1, email: "maulanas430@gmail.com", created_at: "2021-01-04 14:44:20.649778000 +0700", updated_at: "2021-01-04 14:44:20.649778000 +0700", name: "maulanas 1", avatar: "2021-01-02-122342.jpg", slug: "maulanas-1">, 
#<User id: 1, email: "maulanas430@gmail.com", created_at: "2021-01-04 14:44:20.649778000 +0700", updated_at: "2021-01-04 14:44:20.649778000 +0700", name: "maulanas 1", avatar: "2021-01-02-122342.jpg", slug: "maulanas-1">]>


#<User id: 7, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "trash", user_id: 2, created_at: "2021-01-05 08:18:39.026293000 +0700", updated_at: "2021-01-05 09:22:01.283282000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 4, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 8, subject: "percobaan pertama", message: "percobaan pertama yaa inimahh okayyy", status: "inbox", user_id: 2, created_at: "2021-01-05 08:18:39.033623000 +0700", updated_at: "2021-01-05 08:18:39.033623000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 4, recipients: "urang@gmail.com", read: 0>, 
#<User id: 9, subject: "percobaan kedua", message: "percoban kedua", status: "trash", user_id: 2, created_at: "2021-01-05 08:27:54.045309000 +0700", updated_at: "2021-01-05 09:31:08.123983000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 5, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 10, subject: "percobaan kedua", message: "percoban kedua", status: "inbox", user_id: 2, created_at: "2021-01-05 08:27:54.057869000 +0700", updated_at: "2021-01-05 08:30:46.153898000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 5, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 15, subject: "jdak", message: "jsdkashdkj", status: "inbox", user_id: 2, created_at: "2021-01-05 11:56:28.740974000 +0700", updated_at: "2021-01-05 11:56:28.740974000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 8, recipients: "urang@gmail.com", read: 0>, 
#<User id: 16, subject: "jdak", message: "jsdkashdkj", status: "inbox", user_id: 2, created_at: "2021-01-05 11:56:28.748100000 +0700", updated_at: "2021-01-05 11:56:28.748100000 +0700", slug: "yusup-2", email: "yusup@gmail.com", name: "yusup 2", avatar: "2021-01-02-122354.jpg", email_id: 8, recipients: "maulanas430@gmail.com", read: 0>, 
#<User id: 11, subject: "percobaan ketiga", message: "percobaan ketiga", status: "inbox", user_id: 1, created_at: "2021-01-05 08:57:31.025643000 +0700", updated_at: "2021-01-05 08:57:31.025643000 +0700", slug: "maulanas-1", email: "maulanas430@gmail.com", name: "maulanas 1", avatar: "2021-01-02-122342.jpg", email_id: 6, recipients: "yusup@gmail.com", read: 0>, 
#<User id: 12, subject: "percobaan ketiga", message: "percobaan ketiga", status: "trash", user_id: 1, created_at: "2021-01-05 08:57:31.032723000 +0700", updated_at: "2021-01-05 13:14:08.186968000 +0700", slug: "maulanas-1", email: "maulanas430@gmail.com", name: "maulanas 1", avatar: "2021-01-02-122342.jpg", email_id: 6, recipients: "yusup@gmail.com", read: 0>]>

EmailUser.joins(email: :email_users).select("emails.*, email_users.*").pluck(:id, :status)
Email.joins(:email_users).where(status: 'trash')
Email.joins(:email_users).select("email_users.id,email_users.status, email_users.recipients").where(status: 'trash')

@trash = User.joins(emails: :email_users).select("users.name, users.email, emails.subject, emails.message, email_users.recipients, email_users.status, email_users.updated_at, emails.slug, emails.id")

#<Email id: 9, subject: "percobaan kedua", message: "percoban kedua", status: "trash", user_id: 2, created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700", slug: nil>, 
#<Email id: 10, subject: "percobaan kedua", message: "percoban kedua", status: "trash", user_id: 2, created_at: "2021-01-05 08:27:54.031862000 +0700", updated_at: "2021-01-05 09:12:20.565293000 +0700", slug: nil>, #<Email id: 11, subject: "percobaan ketiga", message: "percobaan ketiga", status: "trash", user_id: 1, created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700", slug: nil>, #<Email id: 12, subject: "percobaan ketiga", message: "percobaan ketiga", status: "trash", user_id: 1, created_at: "2021-01-05 08:57:31.013586000 +0700", updated_at: "2021-01-05 09:03:23.110730000 +0700", slug: nil>, #<Email id: 21, subject: "", message: "", status: "trash", user_id: 2, created_at: "2021-01-05 16:16:15.326745000 +0700", updated_at: "2021-01-05 16:16:50.484685000 +0700", slug: nil>, #<Email id: 22, subject: "", message: "", status: "trash", user_id: 2, created_at: "2021-01-05 16:16:15.326745000 +0700", updated_at: "2021-01-05 16:16:50.484685000 +0700", slug: nil>]>

