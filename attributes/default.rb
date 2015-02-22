default["dl_site"] = {
  "mecab"  => "http://mecab.googlecode.com/files/",
}

default["mecab-perl"] = {
  "version" => "0.996",
  "support" => {
    "0.996" => { "checksum" => "4e34fab226800dd99f8d8f2dbd3d891d99059990", "checksum_type" => :SHA1 },
    "0.994" => { "checksum" => "f5a57d1c13f987e001172d870f0e1e73cf6d8610", "checksum_type" => :SHA1 }
  },
  "perl_path" => nil
}
