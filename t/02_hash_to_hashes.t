#!perl

use strict;
use warnings;
use 5.006;

use JSON qw(to_json from_json);
use YAML qw(Dump);

use Data::Structure::Compare qw(
hashes_to_hash
hash_to_hashes_eval
hash_to_hashes_json 
hash_compare);

use Test::More tests => 3;

my $data = {
    key1 => {
        key2 => {
            key3 => 1,
        },
        key4 => 2,
    },
    key5 => 6,
};

my $hash = hashes_to_hash($data);
my $hashes1 = hash_to_hashes_json($hash);
my $hashes2 = hash_to_hashes_eval($hash);

ok(hash_compare($data, $hashes1), 'Data structure is same');
ok(hash_compare($data, $hashes2), 'Data structure is same');
ok(hash_compare($hashes1, $hashes2), 'Data Structure is same');


