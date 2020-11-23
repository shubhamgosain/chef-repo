#
# Cookbook:: shubham_lamp
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#
#
execute "update-upgrade" do
  command "sudo apt-get update && sudo apt-get upgrade -y"
  action :run
end
