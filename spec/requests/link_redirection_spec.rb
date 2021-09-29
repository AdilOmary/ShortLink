require 'rails_helper'

RSpec.describe 'Link redirection', type: :request do
  it 'redirects to the original URL for a given short link'
    url = 'https://twitter.com/'
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
end
