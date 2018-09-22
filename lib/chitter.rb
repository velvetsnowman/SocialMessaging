require 'net/http'
require 'uri'
require 'json'

class Chitter
  def get_posts
    uri = URI.parse("https://chitter-backend-api.herokuapp.com/peeps")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.read_body)
  end

  def signup(name, password)
    uri = URI.parse("https://chitter-backend-api.herokuapp.com/users")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump({
      "user" => {
        "handle" => "#{name}",
        "password" => "#{password}"
      }
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end

end
