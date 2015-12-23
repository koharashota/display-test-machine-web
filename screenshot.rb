# -*- encoding : utf-8 -*-
require "./capybara_conf"

# 保存先ディレクトリにコミットIDでフォルダを作ってスクリーンショットを保存する
#commit_id = `git rev-parse HEAD`.chomp
#save_path = "/screenshot/save/path/" + commit_id + "/"
save_path = "."
pages = [
  "",
]

RSpec.describe "get pages", :type => :feature do
  subject{ page }
  pages.each do |url|
    it "pages: " + url do
      Capybara.current_driver = :poltergeist
      #Capybara.current_driver = :selenium_firefox
      #Capybara.current_driver = :selenium_chrome
      p url
      visit("")
      img_path = ENV['SAVE_PATH'] + "test.png"
      page.save_screenshot(img_path,full: true)
    end
  end
end
