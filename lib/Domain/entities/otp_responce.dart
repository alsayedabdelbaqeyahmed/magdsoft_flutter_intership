class OtpResponce {
  final String? messege;
  final int? status;
  final Map<String, dynamic>? account;

  const OtpResponce({
    this.account,
    this.messege,
    this.status,
  });
}
