#
# Cookbook Name:: chrome
# Recipe:: default
#

if ['solo', 'util'].include?(node[:instance_role])

  name = "www-client/google-chrome"
  version = node[:chrome][:version]
  license_path = "/etc/portage/package.license/local"
  full_name = [name, version].compact.join('-')

  ey_cloud_report "google chrome install" do
    message "Installing google-chrome-#{version}"
  end

  enable_package name do
    version version
    override_hardmask true
  end

  update_file "overriding license for #{full_name}" do
    action :append
    path license_path
    body ">=#{full_name}:stable google-chrome"
    not_if "grep '=#{full_name}' #{license_path}"
  end

  package "www-client/google-chrome" do
    version node[:chrome][:version]
    action :install
  end
end

