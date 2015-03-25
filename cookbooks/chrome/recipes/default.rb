#
# Cookbook Name:: chrome
# Recipe:: default
#

if ['solo', 'util'].include?(node[:instance_role])
  package "www-client/google-chrome" do
    version node[:chrome][:version]
  end
end

