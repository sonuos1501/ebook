
import 'base_vm.dart';

class ViewModelFactory {
  final Map<String, BaseViewModel> creators;

  const ViewModelFactory(this.creators);

  T? create<T extends BaseViewModel>(String modelClass) {
    final creator = creators[modelClass] ??
        creators.entries.firstWhere((element) => element.key == modelClass);
    return creator as T;
  }
}
