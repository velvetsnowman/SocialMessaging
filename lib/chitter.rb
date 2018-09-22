require 'net/http'
require 'uri'
require 'json'

class Chitter
  def get_posts
    uri = URI.parse("https://chitter-backend-api.herokuapp.com/peeps")
    response = Net::HTTP.get_response(uri)
    x = JSON.parse(response.read_body)
    posts = []
    x.each do |post|
      posts << post
    end
    return posts
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

    getSessionKey(name, password)
  end

  def getSessionKey(name, password)
    uri = URI.parse("https://chitter-backend-api.herokuapp.com/sessions")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump({
      "session" => {
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
    JSON.parse(response.body)
  end

  def send_post(auth_token, body, user_id)
    uri = URI.parse("https://chitter-backend-api.herokuapp.com/peeps")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request["Authorization"] = "Token token=" + "#{auth_token}"
    request.body = JSON.dump({
      "peep" => {
        "user_id" => user_id,
        "body" => body
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
