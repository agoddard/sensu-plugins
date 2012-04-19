#
# Cookbook Name:: sensu-plugins
# Recipe:: default
#
# Copyright 2012, Woods Hole Marine Biological Laboratory
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe 'git'
gem_package 'sensu-plugin'


directory node.sensu.community_plugins.directory do
  recursive true
  owner node.sensu.user if node['platform'] != 'windows'
  group node.sensu.group if node.sensu.has_key?(:group)
  mode 0755
end

git node.sensu.community_plugins.directory do
  repository node['sensu']['community_plugins']['repository']
  reference node['sensu']['community_plugins']['branch']
  action :sync
end

