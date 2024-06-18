import 'package:flutter/material.dart';
import 'Quote.dart';

class QueteCard extends StatefulWidget {
  final Quote quote;
  final VoidCallback onDelete;

  const QueteCard({super.key, required this.quote, required this.onDelete});

  @override
  State<QueteCard> createState() => _QueteCardState();
}

class _QueteCardState extends State<QueteCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.quote.text),
      onDismissed: (direction) => {widget.onDelete},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Checkbox(
                value: widget.quote.isDone,
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.quote.isDone = !widget.quote.isDone;
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  widget.onDelete();
                },
                icon: const Icon(Icons.delete),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.quote.text,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "- ${widget.quote.auther}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
