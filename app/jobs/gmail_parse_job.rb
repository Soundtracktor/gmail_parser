# frozen_string_literal: true

class GmailParseJob < ApplicationJob
  queue_as :parser

  def perform(*args)
    # Do something later
  end
end
