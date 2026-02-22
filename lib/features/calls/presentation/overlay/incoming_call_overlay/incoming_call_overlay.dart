
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/call_bloc/call_bloc.dart';

class IncomingCallOverlay extends StatelessWidget {

  final VoidCallback onAccept;
  final VoidCallback onDecline;
  final VoidCallback onOpen;

  const IncomingCallOverlay({
    super.key,

    required this.onAccept,
    required this.onDecline,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallBloc, CallState>(

      builder: (context, state) {
        final String callerName = 'some';
        return SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: onOpen,
                child: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.person),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Incoming call',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              callerName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: onDecline,
                        icon: const Icon(
                          Icons.call_end,
                          color: Colors.red,
                        ),
                      ),

                      IconButton(
                        onPressed: onAccept,
                        icon: const Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}