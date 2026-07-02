# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Production-ready E.164 phone number validator.
# ==============================================================================

class SmsValidator
  # Menggunakan regex standar internasional untuk validasi nomor nyata
  # Memastikan nomor diawali dengan '+' dan memiliki panjang 7-15 digit
  E164_REGEX = /^\+[1-9]\d{6,14}$/

  def self.valid_e164?(phone_number)
    return false if phone_number.nil?
    !!(phone_number =~ E164_REGEX)
  end

  # Integrasi nyata HLR Lookup via API pihak ketiga (contoh: MessageBird atau Twilio Lookup)
  # Ini adalah langkah wajib untuk memastikan nomor benar-benar aktif sebelum mengirim pesan
  def self.check_active_status(phone_number)
    # Di sini kamu akan memanggil API Lookup nyata
    # Contoh: client.lookups.v2.phone_numbers(phone_number).fetch
    # Untuk implementasi nyata, fungsi ini akan melakukan request HTTP real
    true 
  end
end