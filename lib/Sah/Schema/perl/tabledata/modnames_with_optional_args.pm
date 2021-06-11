package Sah::Schema::perl::tabledata::modnames_with_optional_args;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl TableData::* module names without the prefix, with optional args, e.g. ["Locale::US::State", "WordList=wordlist,EN::Enable"]',
    description => <<'_',

Array of Perl TableData::* module names without the prefix and optional args.
Each element is of `perl::tabledata::modname` schema, e.g. `Locale::US::State`,
`WordList=wordlist,EN::Enable`.

Contains coercion rule that expands wildcard, so you can specify:

    Locale::US::*

and it will be expanded to e.g.:

    ["Locale::US::State", "Locale::US::City"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

_
    of => ["perl::tabledata::modname_with_optional_args", {req=>1}, {}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'TableData'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_modname', {ns_prefix=>'TableData'}],

}, {}];

1;
# ABSTRACT:
