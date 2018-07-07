class ContactMailer < ApplicationMailer

  default form: 'notification@example.com'

  def create_picture_mail(picture)
    @picture = picture
    @url = 'https://obscure-shelf-66172.herokuapp.com/'
    mail(to: "totoma855@gmail.com", subject: 'blogを投稿しました')

  end

end
