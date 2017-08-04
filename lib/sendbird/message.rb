module SendBird
  class Message < APIResource
    include SendBird::APIOperations::Delete

    def self.base_url(params = {})
      "#{SendBird.configuration.site}/#{params[:channel_type]}/#{params[:channel_url]}/messages"
    end
    
    def self.edit_url(params = {})
      "#{SendBird.configuration.site}/#{params[:channel_type]}/#{params[:channel_url]}/messages/#{params[:message_id]}"
    end
    
    def mark_as_read
    end
    
    def self.create(params = {}, headers = {})
      response = JSON.parse(RestClient.post(base_url(params), params.to_json, { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body)
    end
    
    def self.edit(params = {}, headers = {})
      response = JSON.parse(RestClient.put(edit_url(params), params.to_json, { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body)
    end
  end
end
