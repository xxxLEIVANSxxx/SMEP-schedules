# Run with: rackup faye.ru -E production -o 0.0.0.0 -p 9292
require "bundler/setup"
require "yaml"
require "faye"

Faye::WebSocket.load_adapter 'thin'

faye = Faye::RackAdapter.new(mount: '/faye', timeout: 45)

run faye