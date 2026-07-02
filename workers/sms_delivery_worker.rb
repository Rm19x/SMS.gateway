# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Background worker to process SMS delivery through the queue.
# ==============================================================================

require 'sidekiq'
require_relative '../lib/gateway_router'
require_relative '../models/sms_log'

class SmsDeliveryWorker
  include Sidekiq::Worker
  # Pengaturan percobaan ulang jika terjadi kegagalan jaringan
  sidekiq_options retry: 3

  def perform(phone_number, message_body)
    # Proses pengiriman nyata melalui routing gateway
    result = GatewayRouter.send_sms(phone_number, message_body)

    # Catat hasil pengiriman ke database untuk riwayat
    SmsLog.create!(
      phone_number: phone_number,
      message_body: message_body,
      status: result[:status],
      gateway_used: result[:gateway]
    )
  end
end
