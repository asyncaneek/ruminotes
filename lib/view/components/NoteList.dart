import 'package:flutter/material.dart';
import 'package:rumi_notes/model/Note.dart';
import 'package:rumi_notes/model/StorageInterface.dart';

class CardList extends StatelessWidget {
  final StorageInterface storage;

  const CardList({Key? key, required this.storage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: storage.getNotesCount(),
      itemBuilder: (context, index) {
        return NoteCard(note: storage.getNoteAtIndex(index));
      },
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key, required this.note}) : super(key: key);

  final Note? note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // align the text to the left instead of centered
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              note?.body ?? "error - no data",
              style: const TextStyle(fontSize: 16),
            ),
            Text(note?.time.toString() ?? "error - nodata"),
          ],
        ),
      ),
    );
  }
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  Future<String> _value;

  @override
  initState() {
    super.initState();
    _value = getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text('Flutter FutureBuilder Demo'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: FutureBuilder<String>(
            future: _value,
            initialData: 'Demo Name',
            builder: (
              BuildContext context,
              AsyncSnapshot<String> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Visibility(
                      visible: snapshot.hasData,
                      child: Text(
                        snapshot.data,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    )
                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Text(snapshot.data,
                      style: const TextStyle(color: Colors.cyan, fontSize: 36));
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          ),
        ),
      ),
    );
  }
}
