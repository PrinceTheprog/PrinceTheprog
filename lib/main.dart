import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/contact_screen.dart';
import 'package:flutter_application_1/screen_message/message.dart';
import 'screen/drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'MyChat';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ListTileSelectExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  bool isSelectionMode = false;
  final int listLength = 10;
  late List<bool> _selected;
  bool _selectAll = false;
  bool _isGridMode = false;

  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            'MyChat',
          ),
          elevation: 5,/*
          leading: isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      isSelectionMode = false;
                    });
                    initializeSelection();
                  },
                )
              : const SizedBox(),
          actions: <Widget>[
            if (_isGridMode)
              IconButton(
                icon: const Icon(Icons.grid_on),
                onPressed: () {
                  setState(() {
                    _isGridMode = false;
                  });
                },
              )
            else
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  setState(() {
                    _isGridMode = true;
                  });
                },
              ),
            if (isSelectionMode)
              TextButton(
                  child: !_selectAll
                      ? const Text(
                          'select all',
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          'unselect all',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () {
                    _selectAll = !_selectAll;
                    setState(() {
                      _selected =
                          List<bool>.generate(listLength, (_) => _selectAll);
                    });
                  }),
          ],*/
        ),
        body: _isGridMode
            ? GridBuilder(
                isSelectionMode: isSelectionMode,
                selectedList: _selected,
                onSelectionChange: (bool x) {
                  setState(() {
                    isSelectionMode = x;
                  });
                },
              )
            : ListBuilder(
                isSelectionMode: isSelectionMode,
                selectedList: _selected,
                onSelectionChange: (bool x) {
                  setState(() {
                    isSelectionMode = x;
                  });
                },
              ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print("Nouveau message");
              },
              tooltip: 'Nouveau message',
              child: const Icon(Icons.send),
            )
          );
              
  }
}

class GridBuilder extends StatefulWidget {
  const GridBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final Function(bool)? onSelectionChange;
  final List<bool> selectedList;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.selectedList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () => _toggle(index),
            onLongPress: () {
              if (!widget.isSelectionMode) {
                setState(() {
                  widget.selectedList[index] = true;
                });
                widget.onSelectionChange!(true);
              }
            },
            child: GridTile(
                child: Container(
              child: widget.isSelectionMode
                  ? Checkbox(
                      onChanged: (bool? x) => _toggle(index),
                      value: widget.selectedList[index])
                  : const Icon(Icons.image),
            )),
          );
        });
  }
}

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
    required this.selectedList,
    required this.isSelectionMode,
    required this.onSelectionChange,
  });

  final bool isSelectionMode;
  final List<bool> selectedList;
  final Function(bool)? onSelectionChange;

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  void _toggle(int index) {
    if (widget.isSelectionMode) {
      setState(() {
        widget.selectedList[index] = !widget.selectedList[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  final List<String> name = <String>['Prince', 'Samuel', 'Wisdom', 'LAWSON'];
  final List<String> lastMessage = <String>[
    'Je suis devant chez toi',
     'Grosse merde vaa', 
     'Salut boss',
     'Bon ce soir, je viens'
     ];
  final String test ;
  final List<String> photo = <String>[
    'A', 
    'B', 
    'C',
    'D'
    ];
    DateTime today = DateTime.now();
    bool load = true;
    return ListView.builder(
        itemCount: name.length,
        itemBuilder: (_, int index) {
          return Card(
            child: ListTile(
                onTap: (){
                  _toggle(index);
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Message()),
                );
                },
                onLongPress: () {
                  if (!widget.isSelectionMode) {
                    setState(() {
                      widget.selectedList[index] = true;
                    });
                    widget.onSelectionChange!(true);
                  }
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Column(
                    children: [
                      load ? 
                      TextButton(child: Text("${DateTime.now().hour}:${DateTime.now().minute}",
                      style: const TextStyle(color: Colors.black26),),
                      onPressed: () {
                        print("ok");
                        setState(() {
                          load = false;
                        });
                        print("$load");
                      }):
                      const Text("ok")
                    ],
                  ),
                  widget.isSelectionMode
                    ? Checkbox(
                        value: widget.selectedList[index],
                        onChanged: (bool? x) => _toggle(index),
                      )
                    : const SizedBox.shrink()]),
                title: Text('  ${name[index]}'),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 1, 1),
                  child: Text(' ${lastMessage[index]}',
                  style: const TextStyle(fontSize: 12, ),),
                ), 
                leading: const CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1663743576525-05db1259983f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80")), 
                
                ),
          );
        });
  }
}
