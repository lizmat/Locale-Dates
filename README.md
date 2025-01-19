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
say $ld.date-representation        # %a %b %e %G
say $ld.time-representation        # %T
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

am
--

```raku
say $ld.am;  # am
```

The `am` method returns the representation of "ante meridiem".

pm
--

```raku
say $ld.pm;  # pm
```

The `pm` method returns the representation of "post meridiem".

date-time-representation
------------------------

```raku
say $ld.date-time-representation;  # %a %b %e %T %Z %G
```

The `date-time-representation` method returns the `strftime` format for the representation of date and time.

date-representation
-------------------

```raku
say $ld.date-representation;  # %a %b %e %G
```

The `date-representation` method returns the `strftime` format for the representation of a date.

time-representation
-------------------

```raku
say $ld.time-representation;  # %T
```

The `time-representation` method returns the `strftime` format for the representation of a time.

CREATING YOUR OWN DATE LOCALE
=============================

```raku
my $ld = Locale::Dates.new(
  code => "foo",
  weekdays => <AAAA BBBB CCCC DDDD EEEE FFFF GGGG>,
  months   => <MMMM NNNN OOOO PPPP QQQQ RRRR
               SSSS TTTT UUUU VVVV WWWW XXXX>,
  am => "meh",
  pm => "duh",
);
```

The `Locale::Dates` class can be instantiated like any other Raku class using named arguments.

code
----

Required. The identifier code of this locale.

weekdays
--------

Required. A `List` with weekday names for this locale, starting at Monday.

months
------

Required. A `List` with month names for this locale, starting at January.

date-time-representation
------------------------

Optional. The `strftime` format representation for date and time for this locale. Defaults to `"%a %e %b %T %Z %G"`.

date-representation
-------------------

Optional. The `strftime` format representation for a date in this locale. Defaults to `"%a %e %b %G"`.

time-representation
-------------------

Optional. The `strftime` format representation for a time in this locale. Defaults to `"%T"`.

am
--

Optional. The representation of "ante meridiem" for this locale. Defaults to "am".

pm
--

Optional. The representation of "post meridiem" for this locale. Defaults to "pm".

abbreviated-weekdays
--------------------

Optional. A `List` with abbreviated weekday names for this locale, starting at Monday. Defaults to the first 3 letters of the weekdays.

abbreviated-months
------------------

Optional. A `List` with abbreviated month names for this locale, starting at January. Defaults to the first 3 letters of the month names.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Locale-Dates . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

