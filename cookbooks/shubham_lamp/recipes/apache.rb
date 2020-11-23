package "apache2" do
	action :install
end

service "apache2" do
	action [:enable, :start]
end

# Apache virtual host


node["lamp_stack"]["sites"].each do |sitename, data|
	document_root = "/var/www/html/#{sitename}"

	directory document_root do
		mode "0755"
		recursive true
	end

	execute "site-enable" do
		command "a2ensite #{sitename}"
		action :nothing
	end

	template "/etc/apache2/sites-available/#{sitename}.conf" do
		source "virtual_hosts.erb"
		mode "0644"
		owner "root"
		group "root"
		variables(
			:document_root => document_root,
			:port => data["port"],
			:serveradmin => data["serveradmin"],
			:servername => data["servername"]
		)
		notifies :run, "execute[site-enable]"
		notifies :restart, "service[apache2]"
	end

	directory "/var/www/html/#{sitename}/public_html" do
    		action :create
  	end
	
	directory "/var/www/html/#{sitename}/logs" do
    		action :create
  	end
end

execute "enable-prefork" do
	command "a2enmode mpm_prefork"
	action :nothing
end

cookbook_file "/etc/apache2/mods-available/mpm_prefork.conf" do
	source "mpm_prefork.conf"
    	mode "0644"
    	notifies :run, "execute[enable-prefork]"
end
