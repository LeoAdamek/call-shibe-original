module Konfrence
  class API < Grape::API

    prefix 'api'
    format :json

    mount ::Konfrence::Callers

    mount ::Konfrence::Status
    mount ::Konfrence::Ping

    mount ::Konfrence::TwilioHooks

    

  end
end
