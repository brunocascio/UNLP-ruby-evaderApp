module ClientsHelper
  def profile_placeholder(client)
    image_tag "placeholder_#{client.genre}.jpg", :class => 'img-circle img-thumbnail profile-img'
  end
end
