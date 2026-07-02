# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Smart routing engine to handle SMS sending via Twilio or Vonage.
# ==============================================================================

require 'twilio-ruby'
require 'vonage'

class GatewayRouter
  def self.send_sms(to_number, message_body)
    begin
      # Mencoba kirim via Twilio
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: to_number,
        body: message_body
      )
      return { status: :success, gateway: 'Twilio' }
      
    rescue => e
      puts "Twilio Error: #{e.message}. Switching to Vonage..."
      
      begin
        # Jika Twilio gagal, switch ke Vonage (Fallback)
        vonage = Vonage::Client.new(api_key: ENV['VONAGE_API_KEY'], api_secret: ENV['VONAGE_API_SECRET'])
        response = vonage.sms.send(
          from: "MrRm19",
          to: to_number,
          text: message_body
        )
        
        if response.messages[0]['status'] == '0'
          return { status: :success, gateway: 'Vonage' }
        else
          return { status: :failed, error: response.messages[0]['error-text'] }
        end
        
      rescue => e_vonage
        return { status: :failed, error: e_vonage.message }
      end
    end
  end
end
