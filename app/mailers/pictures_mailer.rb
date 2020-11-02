class PicturesMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "tototina.ruru@gmail.com", subject: "投稿の確認メール"
  end
end
