class Chitter
  def get_posts
    uri = URI.parse("https://chitter-backend-api.herokuapp.com/peeps")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.read_body)
  end
end
