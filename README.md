# Dart Core Extensions

## Map

```dart
final map = {
    'name': 'than',
    'sub': {'name': 'subname'},
    'list': ['one', 'two', 'three'],
    'int_list': [1,2,3,4],
    'd_list':[1.1,2.2,5.2,5.5]
    };

print(map.get<String>(['key'], def: 'default')); //type T

print(map.getString(['name'], def: 'default value'));

print(map.getBool(['keys'])); //false
print(map.getBool(['keys'], def: true)); //true

print(map.getList<String>(['keys'], def: ['one', 'two'])); // type T

print(map.getStringList(['list'])); //[one, two, three]
print(map.getIntList(['int_list'])); //[1, 2, 3, 4]
print(map.getDoubleList(['d_list'])); //[1.1, 2.2, 5.2, 5.5]
```

## String

```dart
final name = 'thancoder';
print(name.toCaptalize); //Thancoder
print(name.toCaptalizeWords()); //Thancoder

final name = 'than coder';
print(name.toCaptalizeWords());//Than Coder

final name = 'than-coder';
print(name.toCaptalizeWords(splitKey: '-'));//Than-Coder

// path
final name = 'file.png';
print(name.getName()); //file.png
print(name.getName(withExt: false)); //file
print(name.extName); //png


```

## DateTime

```dart

final date = DateTime.now().subtract(Duration(hours: 1, days: 2));

print('timeago: ${date.timeAgo()}');//timeago: 2d ago
print('timeago fullText: ${date.timeAgoFull()}');//timeago fullText: 2 days ago
print('relative: ${date.relativeTime()}');//relative: 2d ago
print('format time: ${date.formatTime(showSeconds: true)}'); //format time: 07:32:01 PM
```

## Duration

```dart
final duration = Duration();

print(duration.autoTimeLabel());
print(duration.calculateEta(0.5)); //progress: 0.0 ~ 1.0
```

## File

```dart
final file = File('');

print(file.getName());
print(file.extName);
print(file.parentPath);
print(file.isDirectory);
print(file.isFile);
print(file.size);
print(file.modified);
print(file.sizeAsync());
print(file.modifiedAsync());
print(file.fileSizeLabel());
```

## Path

```dart
final path = '/home/////than///thancoder//';

print(path.getName());
print(path.extName);
print(path.toCaptalize());
print(path.getNormalizeSlash);
print(path.getCleanBackSlash);
```
