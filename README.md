Send test email
====
This is ruby script to send (HTML) mail by using Gmail account.
(For example, use to confirm mail layout.)

## Requirement
Need to install ruby and gems if you didn't.

gems install
```sh
$ gem install mail
$ gem install json
```

## Usage

### set config

Set Gmail account name and password.  

config/gmail_setting.json

```json
{
  "user_name": "XXXXX@gmail.com",
  "password": "XXXXXXXXXX"
}
```

Set mail info from and to.  

config/gmail_setting.json

```json
{
  "from": "XXXXX@gmail.com",
  "to": ["XXXXX@abc.com", "XXXXX@bcd.co.jp"]
}
```


### set mail template
Put email body to mail_template.html.

## execute
Execute send script.

```sh
ruby test_mailer.rb
```
