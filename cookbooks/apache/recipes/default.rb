#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "apache2" do    #here package is resource type and apache2 is the resource name
    action :install
end

service "apache2" do             #here service is resource type and apache2 is the resource name 
    action [ :enable, :start ]
end

node.default["apache"]["indexfile"] = "index.html"
cookbook_file "/var/www/html/index.html" do  #here cookbook_file is resource type and /var/www/html/index.html is resource name
    source node["apache"]["indexfile"]
    mode "0644"
end