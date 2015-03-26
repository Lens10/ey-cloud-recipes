#
# Cookbook Name:: chromedriver
# Recipe:: default
#
tmp_dir = Chef::Config[:file_cache_path]
download_path = "#{tmp_dir}/#{node['chromedriver']['zip_file']}"
url = "#{node['chromedriver']['url']}"
install_path = "#{node['chromedriver']['install_path']}"
chromedriver_path = "#{install_path}/chromedriver"

package "app-arch/unzip" do
  action :install
end

remote_file "#{download_path}" do
  source "#{url}"
  mode "0644"
  action :create_if_missing
end

execute "unzip #{download_path} -d #{install_path}" do
  creates chromedriver_path
end

file chromedriver_path do
  owner "root"
  group "root"
  mode '0755'
end
