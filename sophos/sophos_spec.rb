require "spec_helper"
require "docker"
require "serverspec"

describe "Sophos Dockerfile" do
   before(:all) do
      Docker.options[:read_timeout] = 900
      get_docker_image(__dir__)
   end

   describe file("/usr/local/bin/savscan") do
      it { should be_linked_to '/opt/sophos-av/bin/savscan' }
   end

   describe file("/opt/sophos-av/bin") do
      it { should be_directory }
   end

   describe file("/opt/sophos-av/bin/_/savscan.0") do
      it { should be_owned_by 'sophosav' }
      it { should be_executable }
   end

end
