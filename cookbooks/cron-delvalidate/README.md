cron-delvalidate Cookbook
=========================
This is a basic cookbook featuring a basic cron for running chef-client every hour on your node(s) and deleteing the validation.pem file for security reasons. It is made to be used as an example for downloading cookbooks for the "Setting Up a Chef Server, Workstation, and Node on Ubuntu 14.04" guide on Linode.com.

Usage
-----

#### cron-delvalidate::default

Included the 1-hour cron for running chef-client and deletes the validation.pem file from your nodes.

License and Authors
-------------------
Elle Krout<br>
Techincal Writer<br>
Linode.com
