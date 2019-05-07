# nd_latin_lookup
A quick and dirty Ruby script to query the University of Notre Dame's Latin archives.

## Usage

ruby nd_latin_lookup.rb LATIN_WORD

For example, this:

```
ruby nd_latin_lookup.rb fabulatus
```
returns:

```
William Whitaker's Words
fabulatus
fabulat.us           VPAR   1 1 NOM S M PERF PASSIVE PPL
fabulo, fabulare, fabulavi, fabulatus  V  INTRANS   [FXXEE]    Medieval  uncommon
fabulor, fabulari, fabulatus sum  V  DEP   [XXXCO]
talk (familiarly), chat, converse; invent a story, make up a fable;
```

## TODOs
1. Parse out the html more cleanly, we're still stuck with "William Whitaker's Words"
2. Add a flag to allow for English->Latin
3. Make a gem
