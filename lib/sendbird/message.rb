module SendBird
  class Message < APIResource
    include SendBird::APIOperations::Delete

    def self.base_url(params = {})
      "#{SendBird.configuration.site}/#{params[:channel_type]}/#{params[:channel_url]}/messages"
    end
    
    def self.resource_url(params = {})
      "#{SendBird.configuration.site}/#{params[:channel_type]}/#{params[:channel_url]}/messages/#{params[:message_id]}"
    end
    
    def mark_as_read
    end
    
    def self.create(params = {}, headers = {})
      response = JSON.parse(
          begin
            RestClient.post(base_url(params), params.to_json, { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body
          rescue RestClient::ExceptionWithResponse => e
            e.response
            puts e.response
          end
        )
    end
    
    def self.edit(params = {}, headers = {})
      response = JSON.parse(
        begin
          RestClient.put(resource_url(params), params.to_json, { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body
        rescue RestClient::ExceptionWithResponse => e
          e.response
          puts e.response
        end
       )
    end
    
    def self.view(params = {}, headers = {})
      response = JSON.parse(RestClient.get(resource_url(params), { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body)
    end
    
    def self.delete(params = {}, headers = {})
      response = JSON.parse(
        begin
          RestClient.delete(resource_url(params), { content_type: :json, 'Api-Token': SendBird.configuration.api_key }).body
        rescue RestClient::ExceptionWithResponse => e
          e.response
          puts e.response
        end
       )
    end
  end
end
