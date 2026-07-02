# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Database model for contacts and group management.
# ==============================================================================

class Contact < ActiveRecord::Base
  # Validasi nyata: memastikan nomor HP tidak kosong dan unik per grup
  validates :phone_number, presence: true, uniqueness: { scope: :group_name }
  validates :group_name, presence: true
end
