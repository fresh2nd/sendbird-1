module SendBird
  class Message < APIResource
    include SendBird::APIOperations::Delete

    def self.base_url(params = {})
      "#{SendBird.configuration.site}/#{params[:channel_type]}/#{params[:channel_url]}/messages"
    end

    def mark_as_read
    end
    
    def create(params = {}, headers = {})
      response = JSON.parse(RestClient.post(base_url(params), params.to_json, { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body)
      convert_to_sendbird_object(response, params)
    end
  end
end
