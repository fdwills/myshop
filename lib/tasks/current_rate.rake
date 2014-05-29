require 'open-uri'
require 'json'

namespace :current_rate do
  desc "Get Current rate from JPY to CNY"
  task :generate => :environment do
    begin
      source = open("http://stocks.finance.yahoo.co.jp/stocks/detail/?code=JPYCNY=X").read().split("\n")
      prices = source.grep(/stoksPrice/)
      if prices.size > 0
        rate = prices[0].gsub(/<[\w\s=\"\/]*>/, '').to_f
        Rails.cache.write("rate", rate)
        SystemMailer.rate_batch_email(User.find_by_id(1), rate).deliver
      end
    rescue => e
        SystemMailer.rate_batch_fault_email(User.find_by_id(1)).deliver
    end
  end
end
