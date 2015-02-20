require 'spec_helper'

describe command('perl -e "require MeCab; print MeCab::Model::version()"') do
  its(:stdout) { should match (/\d\.\d{3}/) }
end
