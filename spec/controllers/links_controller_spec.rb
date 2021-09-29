require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  it 'can shorten a link given by the user' do
    url = 'https:www.favoritewebsite.com/articles/github'
    post :create, params: { link: { original_url: url } }
    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.lookup_code.length).to eq(7)
  end
end
