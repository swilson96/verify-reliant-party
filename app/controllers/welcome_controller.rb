require 'net/http'
require 'json'

class WelcomeController < ApplicationController
  def index
    uri = URI('http://localhost:8080/generate-request')
    request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    request.body = { levelOfAssurance: "LEVEL_2" }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end

    puts response.body

    body = JSON.parse(response.body)

    cookies[:requestId] = {
        :value => body["requestId"]
    }

    @model = body
  end
end
