if ENV['pusher_app_id'].present? and ENV['pusher_key'].present? and ENV['pusher_secret']
  Pusher.app_id = ENV['pusher_app_id']
  Pusher.key = ENV['pusher_key']
  Pusher.secret = ENV['pusher_secret']
  Pusher.http_proxy = ENV['http_proxy'] if ENV['http_proxy'].present?
else
  puts ''
  puts '----------------Pusher-key Required----------------'
  puts ''
  puts ' Pusher-key is required. Please set it'
  puts '                        into the shell environment.'
  puts ''
  puts '   ex.'
  puts '     $ export pusher_app_id=(Your Pusher ID)'
  puts '     $ export pusher_kery=(Your Pusher Key)'
  puts '     $ export pusher_secret0(Your Pusher Secret)'
  puts ''
  puts '---------------------------------------------------'
  puts''
  exit 0
end
