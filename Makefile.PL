use inc::Module::Install;

name 'Event-Join';
all_from 'lib/Event/Join.pm';

requires 'Moose';
requires 'MooseX::AttributeHelpers';

test_requires 'Test::More';
test_requires 'ok';

WriteAll();
