# frozen_string_literal: true

module Parsers
  class Gmail
    include ActiveModel::Model

    attr_accessor :search_id

    def parse
      p search
    end

    private

    def search
      @search ||= Search.find(search_id)
    end
  end
end
