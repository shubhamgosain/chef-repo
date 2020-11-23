mysqlpass = data_bag_item("mysql", "rtpass.json")

mysql_service "mysqldefault" do
  port 3306
  version '5.7'
  initial_root_password mysqlpass["password"]
  action [:create, :start]
end

cookbook_file "/etc/my.cnf" do
  source "my.cnf"
  mode "0644"
end
