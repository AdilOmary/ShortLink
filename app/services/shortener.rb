require 'digest/sha2'

class Shortener
  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
    @url = url
    @link_model = link_model
  end

  def generate_short_link
    link_model.create(original_url: url, lookup_code: lookup_code)
  end

  def lookup_code
    # get a lookupcode
    # check if it already exists
    # break the loop if it does not exist
    # it not, get an other code

    i = 0
    loop do
      code = get_new_code(i)
      break code unless link_model.exists?(lookup_code: code)
      i += 1
    end
  end

  def get_new_code()
    Digest::SHA256.hexdigest(url)[i..(i + 6)]
  end
end
