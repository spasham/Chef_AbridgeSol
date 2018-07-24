The chef-repo
===============
All installations require a central workspace known as the chef-repo. This is a place where primitive objects--cookbooks, roles, environments, data bags, and chef-repo configuration files--are stored and managed.

The chef-repo should be kept under version control, such as [git](http://git-scm.org), and then managed as if it were source code.

Knife Configuration
-------------------
Knife is the [command line interface](https://docs.chef.io/knife.html) for Chef. The chef-repo contains a .chef directory (which is a hidden directory by default) in which the Knife configuration file (knife.rb) is located. This file contains configuration settings for the chef-repo.

The knife.rb file is automatically created by the starter kit. This file can be customized to support configuration settings used by [cloud provider options](https://docs.chef.io/plugin_knife.html) and custom [knife plugins](https://docs.chef.io/plugin_knife_custom.html).

Also located inside the .chef directory are .pem files, which contain private keys used to authenticate requests made to the Chef server. The USERNAME.pem file contains a private key unique to the user (and should never be shared with anyone). The ORGANIZATION-validator.pem file contains a private key that is global to the entire organization (and is used by all nodes and workstations that send requests to the Chef server).

More information about knife.rb configuration options can be found in [the documentation for knife](https://docs.chef.io/config_rb_knife.html).

Cookbooks
---------
A cookbook is the fundamental unit of configuration and policy distribution. A sample cookbook can be found in `cookbooks/starter`. After making changes to any cookbook, you must upload it to the Chef server using knife:

    $ knife upload cookbooks/starter

For more information about cookbooks, see the example files in the `starter` cookbook.

Roles
-----
Roles provide logical grouping of cookbooks and other roles. A sample role can be found at `roles/starter.rb`.

Getting Started
-------------------------
Now that you have the chef-repo ready to go, check out [Learn Chef](https://learn.chef.io/) to proceed with your workstation setup. If you have any questions about Chef you can always ask [our support team](https://www.chef.io/support/) for a helping hand.


# Chef_AbridgeSol: Day #2

##Chef: Day2

Configuration management
Other configuratoin management tools
Companies requirement to choose which tool they have to use

All these conf.mgmt tools known as infrastructure as code (IFAC)
   -programatically provision and configure software components.
   
##Overview of Chef

Chef development kit: it is used by who writes the cookbooks.
Chef server: where all the recipes and cookbooks are reside.

Node: machine which is managed by the chef server.
      Every node machine has to configure so that to which chef server it has to connect and communicate.
      Each node connects to only one chef server.

Chef-client: it runs on all the nodes, it is a agent runs on all the chef nodes.
             The nodes connects to the chef server on a regualr interval (default is every 30min)
             Chef & puppet are pull model conf.mgmt tools.
             
Run-list : list of cookbooks that needs to be run on a node.
roles: 
Resource: everything that goes in a recipe is known as a resources.
Search: searches a resource on a machine.

Resource Types: Networking
                Files
                etc..
                
Organizations: Organization can be a project. The chef server should have atleast one organization.
Role:  Types of server in your infrastructure. such as Load balancer, app server, db cache etc
chef run maintains configuration drift ex: if the node is installed with a software which is not mentioned anywhere in the cookbook then the software will be removed.

once you bootstrap node to chefserver then you cannot install anything manually on that node.
 
knife: interface between chef-server and workstation.

----------------POST TEA BREAK-----------------

Work Station Setup:
   Login to the chef enterprise
   install chefdk on the workstation
   login to the chef.io and setup a hosted chef server.
   get a vm or physical machine to use as a chef node.
   Here we are using an aws instance as a chef node
   
-----------------------
aws: eruser003@gmail.com
eruser3@2012
------------------------

Bootstraping a Node:
-------------------------
 # knife bootstrap <ip addr of node>13.232.192.235 --ssh-user <user name>ubuntu --sudo --identity-file <aws pem key>Pavan.pem --node-n
ame shiva-ubuntu
   "bootstrapping a node means adding a node to the chef server so that the cookbooks can be run on that node through the chef server"
   
  Ohai: system profile
  
  -->cat /etc/chef/client.rb
  add this line ``` log_level  :info ```
  
  What's a cookbook?
      A cookbook is like a "package" for chef recipes
      It contains all the recipes, files, templates etc
      "chef generate cookbook apache"
      
  **Resources are executed in order**
  
  Multiphase Execution-Compile phase
  --During compile phase, Chef
        *Loads all cookbooks from Run list
        *Reads all Recipes to build resource collection
The order of runlist is mandatory in cookfook fie.

Resource Collection:
