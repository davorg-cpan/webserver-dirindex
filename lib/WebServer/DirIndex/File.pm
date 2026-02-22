use strict;
use warnings;
use Feature::Compat::Class;

class WebServer::DirIndex::File v0.0.1 {

  field $url       :param;
  field $name      :param;
  field $size      :param;
  field $mime_type :param;
  field $mtime     :param;

  method url       { return $url       }
  method name      { return $name      }
  method size      { return $size      }
  method mime_type { return $mime_type }
  method mtime     { return $mtime     }

  sub parent_dir {
    return WebServer::DirIndex::File->new(
      url       => '../',
      name      => 'Parent Directory',
      size      => '',
      mime_type => '',
      mtime     => '',
    );
  }
}

1;

__END__

=head1 NAME

WebServer::DirIndex::File - A file entry in a directory index

=head1 SYNOPSIS

  use WebServer::DirIndex::File;

  my $file = WebServer::DirIndex::File->new(
    url       => 'file.txt',
    name      => 'file.txt',
    size      => 1234,
    mime_type => 'text/plain',
    mtime     => 'Thu, 01 Jan 2026 00:00:00 GMT',
  );

  my $parent = WebServer::DirIndex::File->parent_dir;

=head1 DESCRIPTION

This module represents a single file entry in a directory index. It stores
the five pieces of information needed to render a directory listing row.

=head1 CONSTRUCTOR

=over 4

=item new(%args)

Creates a new C<WebServer::DirIndex::File> object. Accepts the following
named parameters:

=over 4

=item url

The URL for the file (possibly URI-escaped).

=item name

The display name of the file.

=item size

The file size in bytes, or an empty string for directories and the parent
entry.

=item mime_type

The MIME type of the file, C<'directory'> for directories, or an empty
string for the parent entry.

=item mtime

The last-modified time as a formatted string, or an empty string for the
parent entry.

=back

=item parent_dir

A class method that returns a C<WebServer::DirIndex::File> object
representing the parent directory entry (C<../>).

=back

=head1 METHODS

=over 4

=item url

Returns the URL of the file.

=item name

Returns the display name of the file.

=item size

Returns the file size.

=item mime_type

Returns the MIME type.

=item mtime

Returns the last-modified time string.

=back

=head1 AUTHOR

Dave Cross E<lt>dave@perlhacks.comE<gt>

=head1 COPYRIGHT

Copyright (c) 2026 Magnum Solutions Limited. All rights reserved.

=head1 LICENCE

This code is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=head1 SEE ALSO

=over 4

=item L<WebServer::DirIndex>

=item L<WebServer::DirIndex::HTML>

=back

=cut
