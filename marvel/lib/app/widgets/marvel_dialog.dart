import 'package:flutter/material.dart';
import 'package:marvel/app/helpers/global_variables.dart';

class MarvelDialog extends StatelessWidget {
  final String title;
  final Icon? iconTitle;
  final String bodyText;
  final Widget? body;
  final List<Widget>? buttons;
  final Color? colorTitle;

  const MarvelDialog({
    this.title = "",
    this.iconTitle,
    this.bodyText = "",
    this.body,
    this.buttons,
    this.colorTitle,
    Key? key,
  }) : super(key: key);

  static const _dialogPadding =
      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0);
  static const _titleTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );
  static const _bodyTextStyle = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.antiAlias,
      insetPadding: _dialogPadding,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      elevation: 5.0,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 450),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title.isNotEmpty) const SizedBox(height: 20.0),
            _buildTitle(),
            MarvelSepator.verySmall,
            if (bodyText.isNotEmpty) ...[
              const Divider(),
              const SizedBox(height: 20.0),
              _buildBodyText(),
              const SizedBox(height: 20.0),
              const Divider(),
            ],
            if (body != null) ...[
              const Divider(),
              _buildBody(),
              const Divider(),
            ] else
              MarvelSepator.medium,
            if (buttons != null) _buildButtons(),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: title.isEmpty ? EdgeInsets.zero : _dialogPadding,
      child: Center(
        child: title.isEmpty
            ? _buildIconTitle()
            : Text(
                title,
                textAlign: TextAlign.center,
                style: _titleTextStyle.copyWith(color: colorTitle),
              ),
      ),
    );
  }

  Widget _buildIconTitle() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: iconTitle,
      ),
    );
  }

  Widget _buildBodyText() {
    return Container(
      margin: _dialogPadding,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Text(
        bodyText,
        style: _bodyTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBody() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 0, maxHeight: 300),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: body!,
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons!,
      ),
    );
  }
}
