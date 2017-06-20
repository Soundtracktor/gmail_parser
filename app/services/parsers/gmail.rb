# frozen_string_literal: true

module Parsers
  class Gmail
    include ActiveModel::Model

    attr_accessor :search_id

    def parse
      emails.each do |email|
        search.results.create!(content: email)
      end
    end

    private

    def search
      @search ||= Search.find(search_id)
    end

    def html
      @html ||= Parsers::Browsers::Gmail.new(search: search).html
    end

    def emails
      @emails ||= fetch_emails
    end

    def fetch_emails
      doc.search('div.Cp tbody tr').map do |tr|
        tr.search('td')[3].search('div')[0].text
      end
    end

    def doc
      @doc ||= Nokogiri::HTML.parse(html)
    end
  end
end
