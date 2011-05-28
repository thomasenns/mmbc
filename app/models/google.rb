require 'rubygems'
require 'httparty'

module Google
  module Directions
    
    class RequestDenied < StandardError; end
    
    class Client
      include HTTParty
      format :json
    
      def request(options = {})
        
        response = self.class.get("http://maps.googleapis.com/maps/api/directions/json", {:query => options})
        
        p response["status"]
                
        if(response["status"] == "OK")
          response["routes"]
        else
          raise_error(response)
        end
      end

      def raise_error(response)
        case response["status"]
          when "REQUEST_DENIED"
            raise RequestDenied, "(#{response["status"]}): #{response["error"]}"
        end
      end
    end
  
    def self.directions(options ={})
      Client.new.request(options.merge!({:sensor => true}))
    end
  end
end