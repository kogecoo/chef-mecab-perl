supported_versions = node["mecab-perl"]["support"].keys
version = node["mecab-perl"]["version"]

# You can specify the place of perl (maybe it is useful for virtualenv user).
perl_path = node["mecab-perl"]["perl_path"]
perl = perl_path ? "#{perl_path}/perl" : "perl"

src_filename_noext = "mecab-perl-#{version}"
src_filename = "#{src_filename_noext}.tar.gz"
src_filepath = "#{node["dl_site"]["mecab"]}#{src_filename}"
copy_to = "#{Chef::Config[:file_cache_path]}/#{src_filename}"

checksum = node["mecab-perl"]["support"][version]["checksum"]
checksum_type = node["mecab-perl"]["support"][version]["checksum_type"]

if not supported_versions.include?(version) then
  Chef::Application.fatal!("#{recipe_name} doesn't support the version #{version}")
end

remote_file copy_to do
  source src_filepath
  mode "0644"
  not_if { no_need_to_copy?(checksum_type, copy_to, checksum) }
  notifies :run, 'execute[install mecab-perl]', :immediately
end

execute "install mecab-perl" do
  user "root"
  cwd Chef::Config[:file_cache_path]
  command <<-EOD
    tar -zxf #{src_filename}
    cd #{src_filename_noext}
    #{perl} Makefile.PL 
    make
    make install
  EOD
end
