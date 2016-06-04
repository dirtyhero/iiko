require 'nokogiri'
require 'open-uri'

namespace "crawl" do
  task image: :environment do
    sites = [
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-1.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://tinxephinh.hayday.mobi/hinh-anh-girl-xinh-gai-sexy-18-1384854244/tuyen-tap-10000-hinh-anh-girl-xinh-nhat-viet-nam.html",
        main_selector: "div.ci"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-2.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-3.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-4.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-5.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-6.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-7.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-8.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://ngamgirl.net/girl-xinh/nu-sinh-ao-dai-viet-nam/anh-ao-dai-nu-sinh-viet-nam-phan-9.html",
        main_selector: "div#bigcolumn"
      },
      {
        url: "http://www.xemanh.net/category/anh-girl-xinh",
        main_selector: "div#posts-container"
      },
      {
        url: "http://www.xemanh.net/category/anh-girl-xinh/page/2",
        main_selector: "div#posts-container"
      },
      {
        url: "http://www.xemanh.net/category/anh-girl-xinh/page/3",
        main_selector: "div#posts-container"
      },
      {
        url: "http://matome.naver.jp/odai/2128076173257260401",
        main_selector: "div.MdMTMWidgetList01"
      }
    ]

    (2..45).each do |n|
      site = {
        url: "http://matome.naver.jp/odai/2128076173257260401?page=#{n}",
        main_selector: "div.MdMTMWidgetList01"
      }
      sites << site
    end

    sites.each do |site|
      puts "Start crawling from #{site[:url]}"
      doc = Nokogiri::HTML(open(site[:url]))
      image_items = doc.search(site[:main_selector]).first.search("img")
      image_items.each do |image|
        Image.create url: image.get_attribute("src")
      end
    end

    puts "Crawled images: #{Image.count}"
  end
end
