# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Database model for real-time SMS logging, search, and purge.
# ==============================================================================

class SmsLog < ActiveRecord::Base
  # Pencarian nyata ( 46)
  scope :search_by_number, ->(number) { where("phone_number LIKE ?", "%#{number}%") }
  
  # Logika nyata untuk hapus data lama ( 42)
  def self.auto_purge(days_old = 30)
    where("created_at < ?", Time.now - (days_old.to_i * 86400)).destroy_all
  end
end