module UrlHelper
  def external_url(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
end
