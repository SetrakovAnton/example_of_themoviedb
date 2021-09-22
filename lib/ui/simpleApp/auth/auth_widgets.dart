import 'package:the_movie_db/ui/simpleApp/auth/auth_model.dart';
import 'package:the_movie_db/ui/simpleApp/mainScreen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/Theme/button.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}):super(key:key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(3, 37, 65, 1),
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25.0,
          ),
          _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDb, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой. Нажмите здесь, чтобы начать.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: const Text('Регистрация')),
          const SizedBox(height: 25),
          const Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, нажмите здесь, чтобы отправить письмо повторно.',
            style: textStyle,
          ),
          const SizedBox(height: 5),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: const Text('Повторное отправление письма')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget{
  _FormWidget({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context){
    final model = AuthProvider.read(context)?.model;

    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      isCollapsed: true,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        const Text(
          'Имя пользователя',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
            controller: model?.loginTextController,
            decoration: textFieldDecorator),
        const SizedBox(height: 20.0),
        const Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model?.passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 25.0,
        ),
        Row(
          children: [
            const _AuthButtonWidget(),
            const SizedBox(
              width: 30.0,
            ),
            TextButton(
              onPressed: (){},
              style: AppButtonStyle.linkButton,
              child: const Text('Сбросить пароль'),
            ),
          ],
        )
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    const color = Color.fromRGBO(1, 180, 228, 1);
    final onPressed = model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true ? const SizedBox(width: 15,height: 15,child: CircularProgressIndicator()) : const Text('Войти');
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        )),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0)),
      ),
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget{
  const _ErrorMessageWidget({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context){
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if(errorMessage == null)
      return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 17,
        ),
      ),
    );
  }
}
