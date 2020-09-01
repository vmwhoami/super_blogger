
module ApplicationHelper
def gravatar_for(obj)
  gravata_id = Digest::MD5.hexdigest(obj.email.downcase)
  image_src = "https://www.gravatar.com/avatar/#{gravata_id}"
  image_tag(image_src,alt: obj.username, class: "rounded-circle")
end

end
