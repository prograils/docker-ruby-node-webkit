require 'serverspec'
require 'docker'

# Workaround needed for circleCI
if ENV['CIRCLECI']
  class Docker::Container
    def remove(*); end
    alias delete remove
  end
end

describe 'Dockerfile' do
  before(:all) do
    image = Docker::Image.build_from_dir('.') do |v|
      matches = v.match(/{\"stream\":\"(Step[^\\"]*)/)
      puts "=> #{matches.captures[0]}" if matches
    end

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
  end

  it 'ubuntu' do
    expect(os_version).to include('Ubuntu 16.04')
  end

  #
  %w(git-core).each do |p|
    it "installs package #{p}" do
      expect(package(p)).to be_installed
    end
  end

  # webkit runtime dependencies
  %w(libqt5webkit5-dev qt5-default xvfb).each do |p|
    it "installs package #{p}" do
      expect(package(p)).to be_installed
    end
  end

  describe command('ruby -v') do
    its(:stdout) { should match(/2\.3\.3p222/) }
  end

  describe command('node -v') do
    its(:stdout) { should match(/6\.10\.1/) }
  end

  describe command('npm -v') do
    its(:stdout) { should match(/3\.10\.10/) }
  end

  describe command('gem list --local') do
    its(:stdout) { should match(/capybara\-webkit\s\(1\.14\.0\)/) }
  end

  def os_version
    command('cat /etc/issue.net').stdout
  end
end
