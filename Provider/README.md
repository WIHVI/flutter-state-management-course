# provider course

## What I Learned

I explored the Provider package, a third-party tool available on pub.dev. This package is incredibly useful for managing state in Flutter applications. It allows the creation of providers, such as 'ChangeNotifier' and 'ValueNotifier', which can then be passed down the widget tree through the 'BuildContext', making them accessible to consumers.

One of the standout features of the Provider package is its simplicity in updating the UI. By using the '.watch()' or '.select()' methods within the 'build()' method of a widget, the Provider package can efficiently trigger widget re-draws whenever the state changes. This leads to more responsive and maintainable code, enhancing the overall development experience.