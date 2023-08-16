Bridgetown.configure do |config|
  config.url = "https://stephendolan.com"

  init :"bridgetown-feed"
  init :"bridgetown-seo-tag"
  init :"bridgetown-sitemap"
end