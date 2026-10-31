const double _kCompactMaxWidth = 400.0;
const double _kContentMaxWidth = 600.0;
const double _kMediumMaxWidth = 1000.0;
const double _kWideMaxWidth = 1200.0;

/// Max content width a shell route applies to every page it hosts on
/// tablet/desktop. Mobile always renders full width.
enum EPageWidth {
  compact(_kCompactMaxWidth),
  content(_kContentMaxWidth),
  medium(_kMediumMaxWidth),
  wide(_kWideMaxWidth),

  /// No cap — the page spans the whole window (e.g. chat).
  full(double.infinity);

  final double maxWidth;

  const EPageWidth(this.maxWidth);
}
