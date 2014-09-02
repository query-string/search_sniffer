module Sofatutor  #:nodoc:
  module SearchSniffer  #:nodoc:

    class ReferringSearch

      # Search engine detetion expressions
      SearchReferers = {
        :google     => [%r{^https?://(www\.)?google.*}, 'q'],
        :bing       => [%r{^https?://(www\.)?bing.*}, 'q'],
        :ask        => [%r{^https?://(www\.)?ask.*}, 'q'],
        :yahoo      => [%r{^https?://(de\.)?search\.yahoo.*}, 'p'],
        :msn        => [%r{^https?://search\.msn.*}, 'q'],
        :aol        => [%r{^https?://search\.aol.*}, 'q'],
        :lycos      => [%r{^https?://search\.lycos.*}, 'query'],
      }

      # Words to exclude when compiling #search_terms
      StopWords = /\b(\d+|\w|about|after|also|an|and|are|as|at|be|because|before|between|but|by|can|com|de|do|en|for|from|has|how|however|htm|html|if|i|in|into|is|it|la|no|of|on|or|other|out|since|site|such|than|that|the|there|these|this|those|to|under|upon|vs|was|what|when|where|whether|which|who|will|with|within|without|www|you|your)\b/i

      attr_reader :search_terms # sanitized search terms
      attr_reader :raw_search_terms # original terms as typed by user
      attr_reader :engine # search engine

      def initialize(referer)
        return if referer.blank?

        if query_string = referer.split('#', 2)[1] || referer.split('?', 2)[1]
          begin
            params = Rack::Utils.parse_query(query_string)
          rescue ArgumentError => e
            if e.message =~ /invalid %-encoding/
              params = {}
            else
              raise
            end
          end
        end

        SearchReferers.each do |engine, v|
          pattern, query_param_name = v
          next unless pattern.match(referer)

          @engine = engine

          break unless params && params.has_key?(query_param_name)

          @raw_search_terms = [params[query_param_name]].flatten.join(' ')
          @search_terms = @raw_search_terms.gsub(StopWords, '').squeeze(' ')
          break
        end
      end

      # Return the referring search string instead of the object serialized into a string
      def to_s
        @search_terms
      end

    end

  end
end
