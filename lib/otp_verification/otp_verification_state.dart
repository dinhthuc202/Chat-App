part of 'otp_verification_cubit.dart';

class OtpVerificationState extends Equatable {
  ///Khai báo các biến
  final bool showDot;
  final bool onSelect;
  TextEditingController controller = TextEditingController();

  OtpVerificationState({
    ///Khởi tạo biến
    this.showDot = true,
    this.onSelect = false,
  });

  @override
  List<Object?> get props => [
        showDot,
    onSelect,
    controller,
      ];

  ///Kiểm tra 2 giá trị selectedIndex khác nhau thì màn hình render lại
  OtpVerificationState copyWith({
    bool? showDot,
    bool? onSelect,
  }) {
    return OtpVerificationState(
      showDot: showDot ?? this.showDot,
        onSelect: onSelect ?? this.onSelect,

    );
  }
}
