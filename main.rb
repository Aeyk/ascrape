#!/usr/bin/env ruby
# coding: utf-8

require 'selenium-webdriver'
require 'sinatra'

set :port, 8001

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://alibaba.com"
wait = Selenium::WebDriver::Wait.new timeout: 20
name = wait.until { 
   driver.find_elements(:class, "m-r4u-product-item-wrapper")
}

open('file', 'a') { |f|
  name.each {|n| f.puts n.attribute 'innerHTML' }
}


get '/' do
  File.read("file")
end
