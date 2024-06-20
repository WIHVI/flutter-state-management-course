# testing inheritedmodel

testing inheritedmodel is a straightforward application that uses InheritedModel to handle state management.

## InheritedModel in Flutter

InheritedModel is a specialized form of InheritedWidget in Flutter that allows widgets to depend on subsets of data rather than the whole set of data. This helps in optimizing the rebuild process, as only the widgets that are affected by changes in the specific subsets of data will be rebuilt.

### Key Features of InheritedModel

1. Subclass of InheritedWidget:
InheritedModel extends InheritedWidget, which means it follows the same principles but with added capabilities for fine-grained dependencies.

2. Contextual Dependencies:
Widgets can specify what part of the model they depend on by using a context that is aware of the dependencies.

3. Efficient Rebuilds:
Only the widgets that depend on the modified aspect of the data are rebuilt, leading to more efficient performance compared to using InheritedWidget where any change causes all dependent widgets to rebuild.

### How InheritedModel Works

InheritedModel works by allowing widgets to depend on specific aspects of the data, thereby optimizing the rebuild process. Here’s a detailed breakdown of how it works:

#### Structure of InheritedModel

1. Subclassing InheritedModel
To create an InheritedModel, you define a subclass that extends InheritedModel. This subclass contains the data you want to share with the descendant widgets and the logic to determine when updates are necessary.

2. Providing Data
You wrap your widget tree with the InheritedModel, providing the data that widgets down the tree will need.

3. Accessing Data
Descendant widgets can access the data provided by the InheritedModel by using the 'of' method, specifying the aspect they depend on.

#### Key Methods in InheritedModel
InheritedModel introduces a couple of methods that are central to its functionality:

1. 'updateShouldNotify'
This method is used to determine if the InheritedModel should notify its dependents when it rebuilds. It compares the new data with the old data and returns 'true' if any relevant data has changed.

2. 'updateShouldNotifyDependent'
This method is called to determine if a dependent widget should be notified about changes in the data it cares about. It takes into account the specific aspects that the dependent widget is interested in.

### Benefits

- Selective Rebuilds: Widgets only rebuild when the aspect of the data they depend on changes.
- Performance Optimization: Reduces unnecessary widget rebuilds, leading to better performance in complex applications.
- Structured Dependencies: Allows a more structured and fine-grained dependency management.

*By using InheritedModel, you gain more control over how and when your widgets rebuild, making your application more efficient and responsive.*