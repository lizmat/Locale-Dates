[![Actions Status](https://github.com/lizmat/Locale-Dates/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Locale-Dates/actions) [![Actions Status](https://github.com/lizmat/Locale-Dates/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Locale-Dates/actions) [![Actions Status](https://github.com/lizmat/Locale-Dates/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Locale-Dates/actions)

NAME
====

Locale::Dates - encapsulate locale information about dates

SYNOPSIS
========

```raku
use Locale::Dates;

my $ld = Locale::Dates("EN");  # or DE NL

say $ld.weekdays[1];              # Monday
say $ld.abbreviated-weekdays[2];  # Tue
say $ld.months[3];                # March
say $ld.abbreviated-months[4];    # Apr

say $ld.code;  # EN
say $ld.am;    # am
say $ld.pm;    # pm

say $ld.date-time-representation;  # %a %b %e %T %Z %G
```

DESCRIPTION
===========

The `Locale-Dates` distribution provides a database of locale information pertaining to dates. And it provides a class to encapsulate bespoke information.

METHODS
=======

weekdays
--------

```raku
say $ld.weekdays[0];  # Sunday
say $ld.weekdays[1];  # Monday
say $ld.weekdays[7];  # Sunday
```

The `weekdays` method returns a `List` with full weekday names, handling both 0-based as well as 1-based weekday values.

abbreviated-weekdays
--------------------

```raku
say $ld.abbreviated-weekdays[0];  # Sun
say $ld.abbreviated-weekdays[1];  # Mon
say $ld.abbreviated-weekdays[7];  # Sun
```

The `abbreviated-weekdays` method returns a `List` with abbreviated weekday names, handling both 0-based as well as 1-based weekday values.

months
------

```raku
say $ld.months[ 1];  # January
say $ld.months[12];  # December
```

The `months` method returns a `List` with full month names. Handles 1-based month values only.

abbreviated-months
------------------

```raku
say $ld.abbreviated-months[ 1];  # Jan
say $ld.abbreviated-months[12];  # Dec
```

The `abbreviated-months` method returns a `List` with abbreviated month names. Handles 1-based month values only.

code
----

```raku
say $ld.code;  # EN
```

The `code` method returns the identifying code of this locale.

code
----

```raku
say $ld.am;  # am
```

The `am` method returns the representation of "ante meridiem".

code
----

```raku
say $ld.pm;  # pm
```

The `pm` method returns the representation of "post meridiem".

code
----

```raku
say $ld.date-time-representation;  # %a %b %e %T %Z %G
```

The `date-time-representation` method returns the `strftime` format for the representation of date and time.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Locale-Dates . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

