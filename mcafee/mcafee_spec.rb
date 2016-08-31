require "spec_helper"
require "docker"
require "serverspec"

describe "McAfee VirusScan Command Line for Unix (Linux 64 bit) Dockerfile" do
   before(:all) do
      Docker.options[:read_timeout] = 1200
      get_docker_image(__dir__)
   end

   describe file("/usr/local/uvscan") do
      it { should be_directory }
   end

   describe file("/usr/local/uvscan/uvscan") do
      it { should be_file }
      it { should be_executable }
   end

   describe file("/usr/local/bin/uvscan") do
      it { should be_linked_to '/usr/local/uvscan/uvscan' }
   end

   describe file("/usr/local/uvscan/avvscan.dat") do
      it { should be_file }
   end

end
