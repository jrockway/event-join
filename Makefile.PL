use inc::Module::Install;

name 'Event-Join';
all_from 'lib/Event/Join.pm';

build_requires 'Test::More';
build_requires 'ok';

WriteAll();
