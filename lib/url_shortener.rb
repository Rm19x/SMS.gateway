# ==============================================================================
# PROJECT  : SMS gateway by Mr.Rm19
# AUTHOR   : Mr.Rm19
# GITHUB   : https://github.com/Rm19x
# DESCRIPTION : Real-world URL shortening service for SMS character optimization.
# ==============================================================================

require 'net/http'
require 'uri'

class UrlShortener
  # Menggunakan endpoint nyata dari penyedia layanan
  # Ini mengirim data asli ke server mereka dan mendapatkan respon URL pendek
  def self.shorten(long_url)
    return long_url if long_url.nil? || long_url.empty?
    
    uri = URI("http://tinyurl.com/api-create.php")
    params = { url: long_url }
    uri.query = URI.encode_www_form(params)
    
    begin
      response = Net::HTTP.get_response(uri)
      response.is_a?(Net::HTTPSuccess) ? response.body : long_url
    rescue => e
      # Log error ke sistem jika koneksi ke server pemendek gagal
      puts "Error connecting to URL Shortener: #{e.message}"
      long_url
    end
  end
end