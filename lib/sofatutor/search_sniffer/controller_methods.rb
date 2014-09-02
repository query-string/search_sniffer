module Sofatutor  #:nodoc:
  module SearchSniffer  #:nodoc:
    module ControllerMethods
      #   Creates @referring_search containing any referring search engine query minus stop words
      #
      # eg. If the HTTP_REFERER header indicates page referer as:
      #     http://www.google.com/search?q=ruby+on+rails+houston&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a
      #
      #     then this function will create:
      #     @referring_search = "Ruby Rails Houston"
      #
      def sniff_referring_search
        # Check whether referring URL was a search engine result
        # uncomment out the line below to test
        # request.env["HTTP_REFERER"] = "http://www.google.com/search?q=ruby+on+rails+houston&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a"
        referer = request.env["HTTP_REFERER"]
        @referring_search = ReferringSearch.new(referer)
        true
      end
    end
  end
end
