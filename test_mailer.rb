require 'mail'
require 'json'

puts "\nstart send mail!\n..."

gmail_setting = JSON.load(File.read("./config/gmail_setting.json"))
send_mail_setting = JSON.load(File.read("./config/send_mail_setting.json"))

mail = Mail.new
options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => "smtp.gmail.com",
            :user_name            => gmail_setting["user_name"],
            :password             => gmail_setting["password"],
            :authentication       => :plain,
            :enable_starttls_auto => true  }

## multipart:html
html_part = Mail::Part.new do
  content_type 'text/html; charset=UTF-8'
  body File.read("./mail_template.html")
end
mail.html_part = html_part

## multipart:text
# html_part = Mail::Part.new do
#   body File.read("./mail_template.txt")
# end
# mail.text_part = text_part

mail.charset = 'utf-8'
mail.from send_mail_setting["from"]
mail.to send_mail_setting["to"]
mail.subject "- test mail -"
# mail.body "set body"
mail.delivery_method(:smtp, options)

mail.deliver

puts "finish!\n\n"

puts "------------ mail details ------------"
puts mail.to_s
