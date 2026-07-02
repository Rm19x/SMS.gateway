# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Migration to create sms_logs table.
# ==============================================================================

class CreateSmsLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :sms_logs do |t|
      t.string :phone_number
      t.text :message_body
      t.string :status
      t.string :gateway_used
      t.timestamps
    end
  end
end
