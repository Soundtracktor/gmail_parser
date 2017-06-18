# frozen_string_literal: true

module Parsers
  class Gmail
    require 'watir'
    include ActiveModel::Model

    attr_accessor :search_id

    def parse
      browser.goto 'gmail.com'
      browser.text_field(:id, 'identifierId').set search.email
      browser.div(:id, 'identifierNext').click

      browser.text_field(:type, 'password').set search.password
      browser.div(:id, 'passwordNext').click

      browser.text_field(:name, 'q').send_keys search_term, :return

      # page = Nokogiri::HTML.parse(browser.html)
      browser.close
    end

    private

    def search
      @search ||= Search.find(search_id)
    end

    def browser
      @browser ||= Watir::Browser.new :chrome
    end

    def search_term
      "after:#{from_date} before:#{to_date_plus_one}"
    end

    def from_date
      search.from_date.strftime('%Y-%m-%d')
    end

    def to_date_plus_one
      (search.to_date + 1.day).strftime('%Y-%m-%d')
    end
  end
end
