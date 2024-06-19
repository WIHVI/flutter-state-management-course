# stateful app

stateful app is a straightforward application that uses InheritedWidget to handle state management.

## InheritedWidget in Flutter

InheritedWidget is a specialized widget in Flutter used to efficiently propagate data down the widget tree. It plays a crucial role in state management by allowing descendant widgets to access shared data without explicitly passing it through the widget tree.

### Key Features of InheritedWidget

1. Efficiency: InheritedWidget is designed to notify only the widgets that depend on the data when there is a change. This minimizes the performance impact.

2. Data Propagation: It helps in making data available to a large number of widgets, ensuring that the data is easily accessible throughout the widget tree.

### How InheritedWidget Works

InheritedWidget itself does not hold any mutable state. Instead, it provides a way to share immutable data and rebuild widgets that rely on this data when it changes. Typically, InheritedWidget is combined with a StatefulWidget to manage state.
