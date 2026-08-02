class Locale::Dates:ver<0.0.7>:auth<zef:lizmat> {
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
  BG => Locale::Dates.new(
    code     => "BG",
    weekdays => <Понеделник Вторник Сряда Четвъртък Петък Събота Неделя>,  # UNCOVERABLE
    months   => <Януари Февруари Март Април Май Юни Юли Август Септември Октомври Ноември Декември>,  # UNCOVERABLE
    date-time-representation => '%a %d %b %Y %T',
    date-representation      => '%d.%m.%Y',
    am => "",
    pm => "",
  ),

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

  FR => Locale::Dates.new(
    code     => "FR",
    weekdays => <lundi mardi mercredi jeudi vendredi samedi dimanche>,  # UNCOVERABLE
    months   => <janvier février mars avril mai juin juillet août septembre octobre novembre décembre>,  # UNCOVERABLE
  ),

  NL => Locale::Dates.new(
    code     => "NL",
    weekdays => <maandag dinsdag woensdag donderdag vrijdag zaterdag zondag>,  # UNCOVERABLE
    months   => <januari februari maart april mei juni juli augustus september oktober november december>,  # UNCOVERABLE
    abbreviated-months => <jan feb mrt apr mei juni jul aug sep okt nov dec>,  # UNCOVERABLE
  ),

  PT => Locale::Dates.new(
    code     => "PT",
    weekdays => <segunda-feira terça-feira quarta-feira quinta-feira sexta-feira sábado domingo>,  # UNCOVERABLE
    months   => <janeiro fevereiro março abril maio junho julho agosto setembro outubro novembro dezembro>,  # UNCOVERABLE
  ),

  RU => Locale::Dates.new(
    code                  => "RU",
    weekdays              => <Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье>,  # UNCOVERABLE
    months                => <января февраля марта апреля мая июня июля августа сентября октября ноября декабря>,  # UNCOVERABLE
    abbreviated-weekdays  => <Пн Вт Ср Чт Пт Сб Вс>,  # UNCOVERABLE
    abbreviated-months    => <янв фев мар апр мая июн июл авг сен окт ноя дек>,  # UNCOVERABLE
    date-time-representation => '%a %d %b %Y %T',
    date-representation      => '%d.%m.%Y',
    am => "",
    pm => "",
),
;

my constant @known-locales = %known-locales.keys.sort;

use MONKEY-TYPING;
augment class Locale::Dates {
    multi method new($locale = "EN") {
        %_
          ?? self.bless(|%_)
          !! %known-locales{$locale} // %known-locales<EN>
    }

    method known-locales() { @known-locales }
}

# vim: expandtab shiftwidth=4
