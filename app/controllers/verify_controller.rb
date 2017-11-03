class VerifyController < ApplicationController
  def receive
    uri = URI('http://localhost:8080/translate-response')
    request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    request.body = {
        samlResponse: params[:SAMLResponse],
        requestId: cookies[:requestId],
        levelOfAssurance: "LEVEL_2"
    }.to_json

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end

    puts response.body

    @json = response.body
  end
end
