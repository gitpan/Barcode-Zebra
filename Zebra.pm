#------------------------------------------------------------------------
#  Copyright 2008-2009 (c) Jeff Brown <spadix@users.sourceforge.net>
#
#  This file is part of the Zebra Barcode Library.
#
#  The Zebra Barcode Library is free software; you can redistribute it
#  and/or modify it under the terms of the GNU Lesser Public License as
#  published by the Free Software Foundation; either version 2.1 of
#  the License, or (at your option) any later version.
#
#  The Zebra Barcode Library is distributed in the hope that it will be
#  useful, but WITHOUT ANY WARRANTY; without even the implied warranty
#  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Lesser Public License for more details.
#
#  You should have received a copy of the GNU Lesser Public License
#  along with the Zebra Barcode Library; if not, write to the Free
#  Software Foundation, Inc., 51 Franklin St, Fifth Floor,
#  Boston, MA  02110-1301  USA
#
#  http://sourceforge.net/projects/zebra
#------------------------------------------------------------------------
package Barcode::Zebra;

use 5.006;
use strict;
use warnings;
use Carp;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(SPACE BAR
                    version increase_verbosity set_verbosity);

our $VERSION = '0.1';

require XSLoader;
XSLoader::load('Barcode::Zebra', $VERSION);

package Barcode::Zebra::Error;

use overload '""' => sub { return($_[0]->error_string()) };

1;
__END__


=head1 NAME

Barcode::Zebra - Perl interface to the Zebra Barcode Reader Library


=head1 SYNOPSIS

setup:

    use Barcode::Zebra;
    
    my $reader = Barcode::Zebra::Processor->new();
    $reader->init();
    $reader->set_data_handler(my_handler);

scan an image:

    my $image = Barcode::Zebra::Image->new();
    $image->set_format('422P');
    $image->set_size(114, 80);
    $image->set_data($raw_bits);
    $reader->process_image($image);

scan from video:

    $reader->set_visible();
    $reader->set_active();
    $reader->user_wait();


=head1 DESCRIPTION

The Zebra Barcode Reader library is a library for scanning and
decoding bar codes from various sources such as video streams, image
files or raw intensity sensors.  It supports EAN, UPC, Code 128, Code
39 and Interleaved 2 of 5.

These are the bindings for interacting directly with the library from
Perl.


=head1 REFERENCE

=head2 Functions

=over 4

=item version()

Returns the version of the zebra library as "I<major>.I<minor>".

=item increase_verbosity()

Increases global library debug by one level.

=item set_verbosity(I<level>)

Sets global library debug to the indicated level.  Higher numbers give
more verbosity.

=back

=head2 Constants

Width stream "color" constants:

=over 4

=item SPACE

Light area or space between bars.

=item BAR

Dark area or colored bar segment.

=back


=head1 SEE ALSO

Barcode::Zebra::Processor, Barcode::Zebra::ImageScanner,
Barcode::Zebra::Image, Barcode::Zebra::Symbol,
Barcode::Zebra::Scanner, Barcode::Zebra::Decoder

zebraimg(1), zebracam(1)

http://zebra.sf.net


=head1 AUTHOR

Jeff Brown, E<lt>spadix@users.sourceforge.netE<gt>


=head1 COPYRIGHT AND LICENSE

Copyright 2008-2009 (c) Jeff Brown E<lt>spadix@users.sourceforge.netE<gt>

The Zebra Barcode Library is free software; you can redistribute it
and/or modify it under the terms of the GNU Lesser Public License as
published by the Free Software Foundation; either version 2.1 of
the License, or (at your option) any later version.

=cut
