class KeywordsController < ApplicationController
  def create
    # Convert submitted array of keywords to an Array
    keywords = params[:keywords].split(",")

    # Strip whitespace from the keywords
    keywords = keywords.collect(&:strip)

    # Remove empty keywords
    keywords = keywords.reject(&:empty?)

    # Render keywords in JSON format
    render :json => keywords

    # TODO: Fallback if form was actually submitted (non-ajax)
  end
end