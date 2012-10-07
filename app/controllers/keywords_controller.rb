require 'adwords_api'

class KeywordsController < ApplicationController
  def create
    # Convert submitted array of keywords to an Array
    keywords = params[:keywords].split(",")

    # Strip whitespace from the keywords
    keywords = keywords.collect(&:strip)

    # Remove empty keywords
    keywords = keywords.reject(&:empty?)

    # AdwordsApi is going to look for config file in ENV["HOME"]
    ENV["HOME"] = Rails.root.join("config").to_s
    adwords = AdwordsApi::Api.new
    tis = adwords.service(:CampaignService, :v201209)
    stuff = tis.get({:fields => ["Id", "Name"]})

    # Render keywords in JSON format
    render :text => stuff.inspect

    # TODO: Fallback if form was actually submitted (non-ajax)
  end
end