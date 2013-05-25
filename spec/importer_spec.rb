require 'spec_helper'

describe Jboss::Community::SassImporter do
  it 'should register its importer with Sass' do
    instance = Jboss::Community::SassImporter.new  

    Sass.load_paths.should include instance
  end

  it 'should return a Sass::Engine when calling find' do
    importer = Jboss::Community::SassImporter.new  

    importer.find('2.3.1.0/bootstrap-community.css', {}).should be_instance_of Sass::Engine
  end
end
