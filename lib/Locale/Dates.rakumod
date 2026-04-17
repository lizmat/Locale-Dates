class Locale::Dates:ver<0.0.6>:auth<zef:lizmat> {
    has str $.code                     is required;
    has     @.weekdays                 is required;
    has     @.months                   is required;
    has     @.abbreviated-weekdays;
    has     @.abbreviated-months;
    has str $.am = "am";
    has str $.pm = "pm";
    has str $.date-time-representation = '%a %e %b %T %Z %Y';
    has str $.date-representation      = '%a %e %b %Y';
    has str $.time-representation      = '%T';

    method TWEAK() {
        # Make sure 0-based weekdays also work
        @!weekdays.unshift(@!weekdays.tail);
        @!weekdays := @!weekdays.List;

        # Normalize abbreviated weekdays
        if @!abbreviated-weekdays {  # UNCOVERABLE
            @!abbreviated-weekdays.unshift(@!abbreviated-weekdays.tail);  # UNCOVERABLE
            @!abbreviated-weekdays := @!abbreviated-weekdays.List;
        }
        else {
            @!abbreviated-weekdays := @!weekdays.map(*.substr(0,3)).List;
        }

        # Months are always 1-based
        @!months.unshift("?");
        @!months := @!months.List;

        # Normalize abbreviated months
        if @!abbreviated-months {  # UNCOVERABLE
            @!abbreviated-months.unshift("?");  # UNCOVERABLE
            @!abbreviated-months := @!abbreviated-months.List;
        }
        else {
            @!abbreviated-months := @!months.map(*.substr(0,3)).List;
        }
    }

    method am(Locale::Dates:D:) { $!am.lc }
    method pm(Locale::Dates:D:) { $!pm.lc }
    method AM(Locale::Dates:D:) { $!am.uc }
    method PM(Locale::Dates:D:) { $!pm.uc }
}

# At some point in time these should probably be generated from locale
# files
my constant %known-locales =
  DE => Locale::Dates.new(
    code     => "DE",
    weekdays => <Montag Dienstag Mittwoch Donnerstag Freitag Samstag Sontag>,  # UNCOVERABLE
    months   => <Januar Februar März April Mai Juni Juli August September Oktober November December>,  # UNCOVERABLE
  ),

  EN => Locale::Dates.new(
    code     => "EN",
    weekdays => <Monday Tuesday Wednesday Thursday Friday Saturday Sunday>,  # UNCOVERABLE
    months   => <January February March April May June July August September October November December>,  # UNCOVERABLE
    date-time-representation => '%a %b %e %T %Z %Y',
    date-representation      => '%a %b %e %Y',
  ),

  NL => Locale::Dates.new(
    code     => "NL",
    weekdays => <maandag dinsdag woensdag donderdag vrijdag zaterdag zondag>,  # UNCOVERABLE
    months   => <januari februari maart april mei juni juli augustus september oktober november december>,  # UNCOVERABLE
    abbreviated-months => <jan feb mrt apr mei juni jul aug sep okt nov dec>,  # UNCOVERABLE
  ),

  RU => Locale::Dates.new(
    code                  => "RU",
    weekdays              => <Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье>,  # UNCOVERABLE
    months                => <января февраля марта апреля мая июня июля августа сентября октября ноября декабря>,  # UNCOVERABLE
    abbreviated-weekdays  => <Пн Вт Ср Чт Пт Сб Вс>,  # UNCOVERABLE
    abbreviated-months    => <янв фев мар апр мая июн июл авг сен окт ноя дек>,  # UNCOVERABLE
    date-time-representation => '%a %d %b %Y %T',
    date-representation      => '%d.%m.%Y',
    am                    => "",
    pm                    => "",
),
;

use MONKEY-TYPING;
augment class Locale::Dates {
    multi method new($locale = "EN") {
        %_
          ?? self.bless(|%_)
          !! %known-locales{$locale} // %known-locales<EN>
    }
}

# vim: expandtab shiftwidth=4
