#!/usr/bin/env ruby

require 'rubygems'
require 'httparty'
require 'json'
require 'pp'

class PoolInfo
  SUCCESS = 200
  TIMEOUT = 10

  def initialize(key)
    @key = key
  end

  def run
    response = HTTParty.get("http://50btc.com/api/#{@key}?text=1")#, :timeout => TIMEOUT)
    print_error(response.code, response.body) if response.code != SUCCESS
    json_response = JSON.parse(response.body)

    # Adjust worker info
    json_response['workers'].each { |w|
      time_str = time_delta_str Time.at(w[1]['last_share'].to_i)
      w[1]['last_share'] = Time.at(w[1]['last_share'].to_i).to_s + " (#{time_str})"
    }

    puts json_response.to_json
  end

  private
  def print_error(code, msg)
    puts "Error retreiving pool information. Code #{code}:\n#{msg}"
    Kernel.exit! -1
  end

  HOUR_S = 3600
  MIN_S = 60
  def time_delta_str(t1)
    delta = Time.now - t1

    if delta < 3600
      "#{(delta / MIN_S).to_i} min ago"
    else
      "#{(delta / HOUR_S).to_i} hr ago"
    end

  end
end

PoolInfo.new(ARGV[0]).run