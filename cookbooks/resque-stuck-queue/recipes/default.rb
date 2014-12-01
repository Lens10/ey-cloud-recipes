#
# Cookbook Name:: resque-stuck-queue
# Recipe:: default
#
if ['solo', 'util'].include?(node[:instance_role])

  node[:applications].each do |app, data|
    template "/etc/monit.d/resque-stuck-queue_#{app}.monitrc" do
      owner 'root'
      group 'root'
      mode 0644
      source "monitrc.conf.erb"
      variables({
        :app_name => app,
        :rails_env => node[:environment][:framework_env]
      })
    end

    execute "ensure-resque-stuck-queue-is-setup-with-monit" do
      # epic_fail true
      command %Q{
        monit reload
      }
    end
  end
end
