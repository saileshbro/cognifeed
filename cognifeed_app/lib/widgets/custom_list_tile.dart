import 'package:cognifeed_app/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomListTile({Key key, this.icon, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey[200].withOpacity(0.2), width: 1)),
          color: BlocProvider.of<ThemeBloc>(context).isDarkTheme
              ? Color(0xff212121)
              : Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: 14,
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
