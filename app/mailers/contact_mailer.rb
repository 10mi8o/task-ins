class ContactMailer < ApplicationMailer

  default form: 'notification@example.com'

  def create_picture_mail(picture)
    @picture = picture
    # @url = 'https://obscure-shelf-66172.herokuapp.com/'
    mail(to: picture.user.email, subject: 'pictureを投稿しました')
    # 自身のアドレスでチェック済み
    # mail(to: "メールアドレスを入力して下さい", subject: 'blogを投稿しました')

  end

end
