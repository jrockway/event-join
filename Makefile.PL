use inc::Module::Install;
use strict;

name 'Event-Join';
all_from 'lib/Event/Join.pm';

requires 'Moose' => '0.94';

test_requires 'Test::More';
test_requires 'ok';

WriteAll();
