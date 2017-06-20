# frozen_string_literal: true

module ViewPresenters
  module Searches
    class Show
      include ActiveModel::Model

      attr_accessor :token, :q

      def search
        @search ||= Search.find_by(token: token)
      end

      def results
        @results ||= query.result(distinct: true)
      end

      def count
        @count ||= results.size
      end

      def query
        @query ||= search.results.ransack(q)
      end

      def title
        "#{search.email} from #{search.from_date} to #{search.to_date}"
      end
    end
  end
end
