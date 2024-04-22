import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class MailSender {
  Future<void> JoinEmailSend(String email, String code) async {
    final message = Message()
      ..from = Address('ghj2587@gmail.com', 'PetMate')
      ..recipients.add(email)
      ..subject = '[PetMate] 회원가입 인증코드 전송'
      ..text =
          '안녕하세요!\nPetMate 입니다.\n귀하의 회원가입을 위한 인증 코드를 발송해드립니다.\n인증코드는 \n\n$code\n\n입니다.\n\n코드의 유지시간은 5분이며 이후에는 소멸합니다.\n감사합니다.\nPetMate 드림\n\n반려인을 위한 모든것! \nPetMate';
    try {
      await send(message, gmail('ghj2587@gmail.com', 'itryzixnwkmbxvxg'));
    } catch (e) {
      print('에러 :$e');
    }
  }

  Future<void> SearchEmailSend(String email, String code) async {
    final message = Message()
      ..from = Address('ghj2587@gmail.com', 'PetMate')
      ..recipients.add(email)
      ..subject = '[PetMate] 비밀번호 찾기 인증코드 전송'
      ..text =
          '안녕하세요!\nPetMate 입니다.\n귀하의 비밀번호 찾기를 위한 인증 코드를 발송해드립니다.\n인증코드는 \n\n$code\n\n입니다.\n\n코드의 유지시간은 5분이며 이후에는 소멸합니다.\n감사합니다.\nPetMate 드림\n\n반려인을 위한 모든것! \nPetMate';
    try {
      await send(message, gmail('ghj2587@gmail.com', 'itryzixnwkmbxvxg'));
    } catch (e) {
      print('에러 :$e');
    }
  }
}
