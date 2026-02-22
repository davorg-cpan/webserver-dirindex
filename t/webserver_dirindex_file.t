use strict;
use warnings;
use Test::More;
use WebServer::DirIndex::File;

my $file = WebServer::DirIndex::File->new(
  url       => '/test/file.txt',
  name      => 'file.txt',
  size      => 1234,
  mime_type => 'text/plain',
  mtime     => 'Thu, 01 Jan 2026 00:00:00 GMT',
);

ok defined $file, 'WebServer::DirIndex::File->new returns an object';
is $file->url,       '/test/file.txt',              'url() returns correct value';
is $file->name,      'file.txt',                    'name() returns correct value';
is $file->size,      1234,                          'size() returns correct value';
is $file->mime_type, 'text/plain',                  'mime_type() returns correct value';
is $file->mtime,     'Thu, 01 Jan 2026 00:00:00 GMT', 'mtime() returns correct value';

my $parent = WebServer::DirIndex::File->parent_dir;
ok defined $parent, 'parent_dir() returns an object';
is $parent->url,       '../',             'parent_dir() has correct URL';
is $parent->name,      'Parent Directory','parent_dir() has correct name';
is $parent->size,      '',               'parent_dir() has empty size';
is $parent->mime_type, '',               'parent_dir() has empty mime_type';
is $parent->mtime,     '',               'parent_dir() has empty mtime';

done_testing;
