use strict;
use warnings;
use Test::More tests => 10;
use Test::Exception;
use Event::Join;

my $done;
my $joiner = Event::Join->new(
    events        => [qw/foo bar baz/],
    on_completion => sub { $done = $_[0] },
    strict        => 1,
);

isa_ok $joiner, 'Event::Join';

throws_ok {
    $joiner->send_event('made up event name');
} qr/'made up event name' is an unknown event/,
  'cannot send invalid events';

ok !$joiner->event_sent('made up event name'), 'invalid event not remembered';

$joiner->send_event('foo', 42);
ok $joiner->event_sent('foo'), 'sent foo';
ok !$done, 'callback not called';

$joiner->send_event('bar');
ok $joiner->event_sent('bar'), 'sent bar';
ok !$done, 'callback not called';

$joiner->send_event('baz', 'hello');
ok $joiner->event_sent('baz'), 'sent baz';

ok $done, 'callback was called';
is_deeply $done, { foo => 42, bar => undef, baz => 'hello' },
  'got correct stuff in $done';
