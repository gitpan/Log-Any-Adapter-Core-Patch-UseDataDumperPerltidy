package Log::Any::Adapter::Core::Patch::UseDataDumperPerltidy;

use 5.010001;
use strict;
no warnings;
use Log::Any; # required prior to loading Log::Any::Adapter::Core

use Module::Patch 0.12 qw();
use base qw(Module::Patch);

use Data::Dumper::Perltidy;

our $VERSION = '0.03'; # VERSION

our %config;

my $_dump_one_line = sub {
    my ($value) = @_;

    local $Data::Dumper::Terse = 1;
    return Dumper($value);
};

sub patch_data {
    return {
        v => 3,
        patches => [
            {
                action      => 'replace',
                mod_version => qr/^0\.\d+$/,
                sub_name    => '_dump_one_line',
                code        => $_dump_one_line,
            },
        ],
    };
}

1;
# ABSTRACT: Use Data::Dumper::Perltidy

__END__

=pod

=encoding UTF-8

=head1 NAME

Log::Any::Adapter::Core::Patch::UseDataDumperPerltidy - Use Data::Dumper::Perltidy

=head1 VERSION

version 0.03

=head1 SYNOPSIS

 use Log::Any '$log';
 use Log::Any::PT; # shortcut for Log::Any::Adapter::Core::Patch::UseDataDumperPerltidy;

 $log->debug("See this data structure: %s", $some_data);

=head1 DESCRIPTION

Log::Any dumps data structures using L<Data::Dumper> with settings: Indent=0.
This is rather hard to read. This patch replaces dumping with using
L<Data::Dumper::Perltidy> which has nicer output.

But note that Data::Dumper::Perltidy is rather slow (about 500x slower than
Data::Dumper and 50x slower than L<Data::Dump>) and has heavier startup time
(about 0.1s, 37K lines). IMO it has the nicest output though.

=for Pod::Coverage ^(patch_data)$

=head1 FAQ

=head1 SEE ALSO

L<Log::Any::Adapter::Core::Patch::SetDumperIndent>

L<Log::Any::Adapter::Core::Patch::UseDataDump>

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Log-Any-Adapter-Core-Patch-UseDataDumperPerltidy>.

=head1 SOURCE

Source repository is at L<https://github.com/sharyanto/perl-Log-Any-Adapter-Core-Patch-UseDataDumperPerltidy>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Log-Any-Adapter-Core-Patch-UseDataDumperPerltidy>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
