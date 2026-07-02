# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Database model for message templates and personalization.
# ==============================================================================

class Message < ActiveRecord::Base
  # Metode nyata untuk memproses variabel dinamis (misal: mengganti {Nama} dengan nama asli)
  def render_content(data_hash)
    content = self.body
    data_hash.each do |key, value|
      content.gsub!("{#{key}}", value.to_s)
    end
    content
  end
end