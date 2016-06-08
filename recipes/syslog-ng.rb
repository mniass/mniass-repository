package "syslog-ng" 

cookbook_file "#{node['mniass-repository']['syslog-ng']['conf_dir']}syslog-ng.conf" do 
  owner node['mniass-repository']['syslog-ng']['user']
	group node['mniass-repository']['syslog-ng']['group']
	mode 00755
end


cookbook_file "/etc/init.d/syslog-ng" do 
  owner node['mniass-repository']['syslog-ng']['user']
	group node['mniass-repository']['syslog-ng']['group']
	mode 00755
end

directory "{node['mniass-repository']['syslog-ng']['conf_dir]}/conf.d" do 
  owner node['mniass-repository']['syslog-ng']['user']
	group node['mniass-repository']['syslog-ng']['group']
	mode 00755
	action :create
end

cookbook_file "{node['mniass-repository']['syslog-ng']['conf_dir]}/conf.d/00base" do 
  owner node['mniass-repository']['syslog-ng']['user']
	group node['mniass-repository']['syslog-ng']['group']
	mode 00755 
end


directory  "{node['mniass-repository']['syslog-ng']}/log_dir" do 
 owner node['mniass-repository']['syslog-ng']['user']
 group node['mniass-repository']['syslog-ng']['group']
 mode 00755
 action :create
end


service "syslog" do 
 action [ :disable, :stop ]
end

service "rsyslog" do 
  action [ :disable, :stop ] 
end

service "syslog-ng" do 
 supports :restart => true, :status => true
 action [ :enable, :start ]
end

