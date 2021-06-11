package Sah::Schema::perl::tabledata::modname_with_optional_args;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Perl TableData::* module name without the prefix (e.g. Locale::US::State) with optional arguments (e.g. WordList=wordlist,EN::Enable)',
    description => <<'_',

Perl TableData::* module name without the prefix, with optional arguments which
will be used as instantiation arguments, just like the `-MMODULE=ARGS` shortcut
that `perl` provides. Examples:

    Locale::US::State
    WordList=wordlist,EN::Enable

See also: `perl::tabledata::modname`.

_
    match => '\A[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*(?:=.*)?\z',

    'x.perl.coerce_rules' => [
        ['From_str::normalize_perl_modname', {ns_prefix=>'TableData'}],
    ],

    # XXX also provide completion for arguments
    'x.completion' => ['perl_modname', {ns_prefix=>'TableData'}],


    examples => [
        {value=>'', valid=>0},
        {value=>'Foo/Bar', valid=>1, validated_value=>'Foo::Bar'},
        {value=>'Foo/Bar=a,1,b,2', valid=>1, validated_value=>'Foo::Bar=a,1,b,2'},
        {value=>'Foo bar', valid=>0},
    ],

}, {}];

1;
# ABSTRACT:
