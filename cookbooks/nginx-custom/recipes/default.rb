#
# Cookbook Name:: nginx-custom
# Recipe:: default
#

if ['app_master', 'app', 'solo'].include?(node[:instance_role])
  node[:applications].each do |app, data|
    template "/data/nginx/servers/#{app}/custom.conf" do
      source 'custom.conf.erb'
      owner node[:owner_name]
      group node[:owner_name]
      mode 0644
      variables({
        :authentication => "Restricted",
        :authenticaion_user_file => "/data/nginx/servers/#{app}/#{app}.users",
        :passenger_status => "on"
      })
    end

    execute "sudo /etc/init.d/nginx reload"
  end
end
