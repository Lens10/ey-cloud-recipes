# default[:rake_tasks]['resque-scheduler'] = {
#   :task => "resque:scheduler",
#   :file_name => "resque_scheduler",
#   :folder_name => "resque-scheduler",
#   :task_name => "resque-scheduler",
#   :process_name => "resque-scheduler",
#   :monit_process_name => "monit-resquescheduler"
# }

default[:rake_tasks]['resque-stuck-queue'] = {
  :task => "resque:stuck_queue_start",
  :file_name => "resque_stuck_queue",
  :folder_name => "resque-stuck-queue",
  :task_name => "resque-stuck-queue",
  :process_name => "resque-stuck-queue",
  :monit_process_name => "monit-resque-stuck-queue"
}

default[:rake_tasks]['newrelic_aws_s3'] = {
  :task => "newrelic:monitor_aws_s3",
  :file_name => "newrelic_aws_s3",
  :folder_name => "newrelic_aws_s3",
  :task_name => "newrelic_aws_s3",
  :process_name => "newrelic_aws_s3",
  :monit_process_name => "monit-newrelic_aws_s3"
}

# default[:rake_tasks][:tasks] = ['resque-stuck-queue']
