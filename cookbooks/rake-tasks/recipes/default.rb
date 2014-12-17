#
# Cookbook Name:: rake-tasks
# Recipe:: default
#
if ['util'].include?(node[:instance_role])
  execute "install resque gem" do
    command "gem install resque redis redis-namespace yajl-ruby -r"
    not_if { "gem list | grep resque" }
  end

  node[:applications].each do |app, data|
    node[:rake_tasks].each do |rake_task_name, rake_task|
      template "/etc/monit.d/#{rake_task[:process_name]}_#{app}.monitrc" do
        owner 'root'
        group 'root'
        mode 0644
        source "rake-task.monitrc.erb"
        variables({
          :app_name => app,
          :rails_env => node[:environment][:framework_env],
          :rake_task => rake_task
        })
      end

      template "/data/#{app}/shared/bin/#{rake_task[:task_name]}" do
        owner 'root'
        group 'root'
        mode 0755
        source "rake-task.erb"
        variables({
          :app_name => app,
          :rake_task => rake_task
        })
      end
    end
  end

  execute "ensure-rake-tasks-is-setup-with-monit" do
    command %Q{
      monit reload
    }
  end
end
