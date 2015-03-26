default['chromedriver']['version'] = '2.14'
default['chromedriver']['zip_file'] = "chromedriver_linux64.zip"
default['chromedriver']['url'] = "http://chromedriver.storage.googleapis.com/#{node['chromedriver']['version']}/#{node['chromedriver']['zip_file']}"
default['chromedriver']['install_path'] = '/usr/local/bin'
