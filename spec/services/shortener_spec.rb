require 'rails_helper'

RSpec.describe Shortener do
  it 'shortens a given URL to a 7 character lookup code' do
    url = 'https://www.website.com/articles/github'
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it 'gives each URL its own lookup code' do
    url = 'https://www.website.com/articles/github'
    shortener = Shortener.new(url)
    code1 = shortener.lookup_code

    url = 'https://www.website.com/articles/twitter'
    shortener = Shortener.new(url)
    code2 = shortener.lookup_code

    expect(code2).not_to eq(code1)
  end

  it 'generates a Link record with a unique lookup code' do
    url = 'https://www.website.com/articles/github'
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)

    link2 = shortener.generate_short_link
    expect(link2.valid?).to be(true)
  end
end
