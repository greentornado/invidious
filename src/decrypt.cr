require "digest/md5"
require "file_utils"
require "kemal"
require "markdown"
require "openssl/hmac"
require "option_parser"
require "pg"
require "sqlite3"
require "xml"
require "yaml"
require "zip"
require "./invidious/helpers/*"
require "./invidious/*"
CONFIG  = Config.from_yaml(File.read("config/config.yml"))
YT_URL  = URI.parse("https://www.youtube.com")
LOCALES = {
  "ar"    => load_locale("ar"),
  "de"    => load_locale("de"),
  "el"    => load_locale("el"),
  "en-US" => load_locale("en-US"),
  "eo"    => load_locale("eo"),
  "es"    => load_locale("es"),
  "eu"    => load_locale("eu"),
  "fr"    => load_locale("fr"),
  "is"    => load_locale("is"),
  "it"    => load_locale("it"),
  "nb_NO" => load_locale("nb_NO"),
  "nl"    => load_locale("nl"),
  "pl"    => load_locale("pl"),
  "ru"    => load_locale("ru"),
  "uk"    => load_locale("uk"),
  "zh-CN" => load_locale("zh-CN"),
}

config = CONFIG
decrypt_function = [] of {name: String, value: Int32}
update_decrypt_function do |function|
  decrypt_function = function
end

video = get_video_without_pg("o3vjAz8FXDE", region: "en-US")
video.to_json("en-US", config, Kemal.config, decrypt_function)
