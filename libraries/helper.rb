# Alternative utiliti for a checksum property of remote_file
#
# Reference:
# https://docs.chef.io/resource_remote_file.html
# http://tech.yipit.com/2013/05/09/pragmatic-chef-verifying-remote-files/

def no_need_to_copy?(type, file, expect)
  ::File.exists?(file) and verify_checksum(type, file, expect)
end

def verify_checksum(type, file, expect)
  require 'digest'
  case type
  when :SHA256
    Digest::SHA256.file(file).hexdigest === expect
  when :SHA1
    Digest::SHA1.file(file).hexdigest === expect
  when :MD5
    Digest::MD5.file(file).hexdigest === expect
  else
    raise "Unknown type of digest : #{type}" 
  end
end
