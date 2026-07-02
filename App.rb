# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# ==============================================================================

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require_relative 'models/sms_log'
require_relative 'workers/sms_delivery_worker'

set :database_file, 'config/database.yml'

get '/' do
  @total_sent = SmsLog.count
  erb :dashboard
end

post '/send' do
  # Logika kirim pesan via background worker
  SmsDeliveryWorker.perform_async(params[:phone], params[:message])
  "Pesan sedang diproses di antrean."
end

get '/logs' do
  @logs = SmsLog.all
  erb :logs
end