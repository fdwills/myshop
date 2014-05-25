require 'open-uri'
require 'json'

namespace :current_rate do
  desc "Get Current rate from JPY to CNY"
  task :generate => :environment do
    source = open("http://stocks.finance.yahoo.co.jp/stocks/detail/?code=JPYCNY=X").read().split("\n")
    prices = source.grep(/stoksPrice/)
    if prices.size > 0
      rate = prices[0].gsub(/<[\w\s=\"\/]*>/, '').to_f
      Rails.cache.write("rate", rate)
    end
  end
end
