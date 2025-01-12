# app/mailers/webforms_mailer.rb
class WebformsMailer < ApplicationMailer
  def batch_upload_email(uni_updates_batch, duplicates)
    @uni_updates_batch = uni_updates_batch
    @duplicates = duplicates
    all_recipients = ['sul-unicorn-devs@lists.stanford.edu']
    if @uni_updates_batch.user_email
      form_recipients = @uni_updates_batch.user_email.split(/[\s,;]+/)
      form_recipients.each { |r| all_recipients << r.strip }
    end
    all_recipients.join(',')
    mail(to: all_recipients, subject: 'Batch update request')
  end

  def batch_delete_email(uni_updates_batch)
    @uni_updates_batch = uni_updates_batch
    all_recipients = ['sul-unicorn-devs@lists.stanford.edu']
    if @uni_updates_batch.user_email
      form_recipients = @uni_updates_batch.user_email.split(/[\s,;]+/)
      form_recipients.each { |r| all_recipients << r.strip }
    end
    all_recipients.join(',')
    mail(to: all_recipients, subject: 'Batch update deletion')
  end

  def sal3_batch_email(sal3_batch_requests_batch)
    @sal3_batch_requests_batch = sal3_batch_requests_batch
    all_recipients = ['sul-unicorn-devs@lists.stanford.edu, sal3contact@stanford.edu']
    if @sal3_batch_requests_batch.user_email
      form_recipients = @sal3_batch_requests_batch.user_email.split(/[\s,;]+/)
      form_recipients.each { |r| all_recipients << r.strip }
    end
    all_recipients.join(',')
    mail(to: all_recipients, subject: 'SAL3 pull request')
  end
end
