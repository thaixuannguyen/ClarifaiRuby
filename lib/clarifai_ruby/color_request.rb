module ClarifaiRuby
  class ColorRequest
    COLOR_PATH = '/color'
    attr_reader :raw_response, :options

    def initialize
      @client = Client.new
    end

    def get(url)

      query = {
        url: url
      }

      request = @client.get(COLOR_PATH, query)
      original_response = request.response
      if original_response.code.to_i >= 200 && original_response.code.to_i < 300
        @raw_response = request.parsed_response
        ColorResponse.new(raw_response)
      else
        raise ClarifaiRuby::RequestError.new("#{original_response.message}: #{original_response.body}", original_response.code.to_i)
      end
    end
  end
end
