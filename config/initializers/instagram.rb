

CALLBACK_URL = "http://localhost:3000"

Instagram.configure do |config|
  config.client_id = "052c85c8dfe94c1da291e6c5315051ff"
  config.client_secret = "58a345758d8b4b2ca76db32501a563e1"
  config.access_token = "8035257.052c85c.fbc9ded6488c44e2a7be19a7687bb6e7"
end



# get "/location_media" do
#   @latitude = 51.5225340
#   @longitude = -0.1094360
#   url = "https://api.instagram.com/v1/media/search?lat=#{@latitude}&lng=#{@longitude}&access_token=8035257.f59def8.eee22f36e41a47b18743bbc27bf7fbd0"
#   html = Httparty.get(url)
#   @hash = JSON(html)
# end

# Instagram.media_search(51.5225340,-0.1094360)

@instagram = Instagram.media_search(51.5225340,-0.1094360)
@instagram.first.tags


