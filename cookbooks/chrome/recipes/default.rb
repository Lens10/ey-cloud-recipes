#
# Cookbook Name:: chrome
# Recipe:: default
#

if ['solo', 'util'].include?(node[:instance_role])
  ey_cloud_report "google chrome install" do
    message "Installing google-chrome-#{node[:chrome][:version]}"
  end

  enable_package "www-client/google-chrome" do
    version node[:chrome][:version]
    override_hardmask true
  end

  package "www-client/google-chrome" do
    version node[:chrome][:version]
    action :install
  end
end

