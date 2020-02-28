#!/usr/bin/env ruby
# coding: utf-8

require 'watir'
require 'sinatra'

browser = Watir::Browser.start  'https://sale.alibaba.com/march-expo/dlehea41q/index.html?spm=a2700.8293689.rts.4.2ce267aftnUqhD&deliveryId=979007_901035201_STOCK_9_52182559&topOfferIds=62412686457&tracelog=20190903_ICBU_PC_BELT'
"hg-product log_product"
driver = browser.driver

# => 'Guides – Watir Project'
pp newthing = browser.div(class: "hg-product").wait_until(&:present?)

# <link href="//s.alicdn.com/@g/sc/header-footer/0.0.31/sc-header-footer/header/entrances/global-header-new/header.css" rel="stylesheet" type="text/css"></link>

open("file.html", "w"){ |f|
  f.puts browser.div(class: "hg-product").html, '<link href="//s.alicdn.com/@g/sc/header-footer/0.0.31/sc-header-footer/header/entrances/global-header-new/header.css" rel="stylesheet" type="text/css"></link>'

}
browser.close

get '/' do
  send_file("file.html")
end



