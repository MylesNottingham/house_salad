class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params[:state])
  end

  def search
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
    end

    response = conn.get("/congress/v1/118/senate/members.json")

    data = JSON.parse(response.body, symbolize_names: true)

    members = data[:results][0][:members]

    found_members = members.find_all {|member| member[:last_name] == params[:search]}

    @member = found_members.first

    render "welcome/index"
  end
end
