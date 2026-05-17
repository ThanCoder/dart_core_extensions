// ignore_for_file: public_member_api_docs, sort_constructors_first
///(years, months, weeks, days)
class AgeDetail {
  final int years;
  final int months;
  final int weeks;
  final int days;
  const AgeDetail({
    required this.years,
    required this.months,
    required this.weeks,
    required this.days,
  });
  factory AgeDetail.empty() {
    return AgeDetail(years: 0, months: 0, weeks: 0, days: 0);
  }

  @override
  String toString() {
    return 'AgeDetail(years: $years, months: $months, weeks: $weeks, days: $days)';
  }
}
