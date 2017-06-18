# frozen_string_literal: true

class GmailParseJob < ApplicationJob
  queue_as :parser

  def perform(search_id:)
  	Parsers::Gmail.new(search_id: search_id).parse
  end
end
