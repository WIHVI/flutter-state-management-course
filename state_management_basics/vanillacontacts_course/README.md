# vanilla contacts

Vanilla Contacts is a straightforward application that uses ValueNotifier to handle state management, enabling it to display a contact as soon as it is added.
Through this course, I've learned how to effectively use ValueNotifier to notify listeners when the value changes.

## ValueNotifier Overview

'ValueNotifier<T>' is a generic class that extends 'ChangeNotifier' and holds a single value of type 'T'. It provides a way to listen for changes to that value and react accordingly. The main advantage of using 'ValueNotifier' is its simplicity and ease of use, especially for managing small pieces of state.

## ValueNotifier Key Features

1. Value Storage and Notification:
 - The primary feature of 'ValueNotifier' is that it stores a value and notifies its listeners whenever the value changes.
 - The 'value' property is used to get or set the value. When the value is set, it triggers the notification to the listeners.

 2. Listeners:
 - 'ValueNotifier' allows adding listeners using the 'addListener' method. These listeners are notified whenever the value changes.
 - It also provides methods to remove listeners ('removeListener') and dispose of the notifier ('dispose').