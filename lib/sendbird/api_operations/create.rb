module SendBird
  module APIOperations
    module Create
      def create(params = {}, headers = {})
        response = JSON.parse(
          begin
             RestClient.post(base_url(params), params.to_json, { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body
          rescue RestClient::ExceptionWithResponse => e
             e.response
              puts e.response
           end
          )
        convert_to_sendbird_object(response, params)
      end
    end
  end
end
