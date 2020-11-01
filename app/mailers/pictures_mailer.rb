class PicturesMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "tototina.ruru@gmail.com", subject: "お問い合わせの確認メール"
  end
end
