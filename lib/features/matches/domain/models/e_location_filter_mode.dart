/// The two, mutually-exclusive ways `MatchesFilter` can narrow candidates by
/// location. Only one may be active at a time — see `MatchesFilterX` in
/// `matches_filter.dart`.
enum ELocationFilterMode {
  place,
  radius,
}
