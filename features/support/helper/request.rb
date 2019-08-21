require 'rest-client'

module Helpers
  module API
    module Request
      class << self
        def http_post(end_point = nil, parameters = nil, headers = nil)
          path = "#{BOOKS_API_URL}#{end_point}"
          http_call(:post, path, parameters, headers)
        end

        def http_put(end_point, parameters = nil, headers = nil)
          path = "#{BOOKS_API_URL}#{end_point}"
          http_call(:put, path, parameters, headers)
        end

        def http_delete(end_point, parameters = nil, headers = nil)
          path = "#{BOOKS_API_URL}#{end_point}"
          http_call(:delete, path, parameters, headers)
        end

        def http_get(parameters = nil, end_point= nil)
          path = "#{BOOKS_API_URL}#{end_point}"
          http_call(:get, path, parameters)
        end

        private

        def http_call(method, path, parameters = nil, headers = nil)
          begin
            response =
              case method
              when :get
                RestClient.get(path, params: parameters)
              when :post
                RestClient.post(path, parameters, headers)
              when :put
                RestClient.put(path, parameters, headers)
              when :delete
                RestClient.delete(path, headers)
              end
          rescue Exception => error
            response = error.response
          end
          response
        end
      end
    end
  end
end
