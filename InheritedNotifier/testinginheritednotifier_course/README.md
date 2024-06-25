# testing inheritednotifier

testing inheritednotifier is a straightforward application that uses InheritedNotifier to handle state management.

## What I Learned

1. ChangeNotifier:
 - This is a class that allows you to wrap your state and value changes. By using an instance of ChangeNotifier, you can manage and notify listeners about changes in the state or values.

2. InheritedNotifier:
 - To consume the changes managed by ChangeNotifier, you use an InheritedNotifier. It has two key components:
    - notifier: This is your ChangeNotifier instance.
    - child: This can be any widget that needs to be updated based on the changes.

3. Using a Builder with InheritedNotifier:
 - It's important to use a Builder inside InheritedNotifier to directly access and utilize the inherited notifier. This ensures that the widgets rebuild correctly when the state or values change.

## InheritedNotifier in Flutter

InheritedNotifier is a specialized type of InheritedWidget in Flutter. It combines the functionality of InheritedWidget and ChangeNotifier to provide a powerful mechanism for efficient state propagation and change notification in a widget tree.

### Key Concepts:

1. InheritedWidget:

 - InheritedWidget is a base class that allows the sharing of data down the widget tree. Subclasses of InheritedWidget are used to propagate data to descendant widgets.

 - It uses the updateShouldNotify method to determine if the widget should notify its dependents about changes.

2. ChangeNotifier:

 - ChangeNotifier is a class that provides a change notification API using the Observer pattern. It maintains a list of listeners that it notifies whenever a change occurs.

3. InheritedNotifier:

 - InheritedNotifier combines the above two concepts. It listens to a ChangeNotifier and triggers updates to its dependents when the notifier changes.

 - This is particularly useful when you want a part of your widget tree to rebuild in response to changes in a ChangeNotifier.

### How InheritedNotifier Works:

 - Data Propagation: InheritedNotifier makes it easy to propagate state changes down the widget tree. When the ChangeNotifier changes, InheritedNotifier automatically notifies its dependents, causing them to rebuild.
 
 - Efficient Updates: It ensures efficient updates because only the parts of the widget tree that are dependent on the notifier are rebuilt.

 - Usage: It is often used with models or services that extend ChangeNotifier, such as ViewModels in the MVVM pattern or controllers in state management solutions like Provider.

### Conclusion

InheritedNotifier is a powerful tool in Flutter that combines the capabilities of InheritedWidget and ChangeNotifier to create a responsive and efficient way to manage state in your widget tree. By leveraging this widget, you can ensure that your app updates efficiently, only rebuilding the parts of the UI that depend on the changing state. This leads to better performance and a more maintainable codebase.