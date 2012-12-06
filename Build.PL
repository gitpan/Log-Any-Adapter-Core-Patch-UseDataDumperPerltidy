
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Use Data::Dumper::Perltidy",
  "dist_author" => [
    "Steven Haryanto <stevenharyanto\@gmail.com>"
  ],
  "dist_name" => "Log-Any-Adapter-Core-Patch-UseDataDumperPerltidy",
  "dist_version" => "0.02",
  "license" => "perl",
  "module_name" => "Log::Any::Adapter::Core::Patch::UseDataDumperPerltidy",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Data::Dumper::Perltidy" => 0,
    "Log::Any" => "0.14",
    "Module::Patch" => "0.12",
    "perl" => "5.010001"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
