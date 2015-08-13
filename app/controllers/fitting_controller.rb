class FittingController < ApplicationController
  def index
    request
  end

  private
  def request
    binding.pry
    conn = Faraday.new(url: "http://localhost:9000") do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    conn.get do |req|
      req.url '/fitting'
      req.headers['Content-Type'] = 'application/json'
      req.body = '{"id":1, "fit_type":"Job", "target":["a","b","c"]}'
    end
  end
end
