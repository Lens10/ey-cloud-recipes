#
# Cookbook Name:: chrome
# Recipe:: default
#

if ['solo', 'util'].include?(node[:instance_role])
  unmask_package "www-client/google-chrome" do
    version node[:chrome][:version]
    unmaskfile "google-chrome"
  end
end

