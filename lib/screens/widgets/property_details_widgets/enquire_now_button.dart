import 'package:flutter/material.dart';

class EnquireNowButton extends StatelessWidget {
  final String auctionStatus;
  final String? highestBid;
  final DateTime? auctionEndTime;

  const EnquireNowButton({
    super.key,
    required this.auctionStatus,
    this.highestBid,
    this.auctionEndTime,
  });

  @override
  Widget build(BuildContext context) {
    return auctionStatus == 'Auction is live'
        ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String message = '';

                  return AlertDialog(
                    title: const Text('Message'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          onChanged: (value) {
                            message = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Write your message here',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            print('Sending message: $message');
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFCA996E),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Send',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFCA996E),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: const Size(150, 50),
            ),
            child: const Text(
              'Enquire Now',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        const SizedBox(width: 10),
        if (highestBid != null)
          Text(
            'Highest Bid: \n$highestBid',
            style: const TextStyle(fontSize: 16),
          ),
      ],
    )
        : ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            String message = '';

            return AlertDialog(
              title: const Text('Message'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Write your message here',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print('Sending message: $message');
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCA996E),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Send',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFCA996E),
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text(
        'Enquire Now',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class CountdownTimer extends StatelessWidget {
  final DateTime endTime;

  const CountdownTimer({super.key, required this.endTime});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: endTime.difference(DateTime.now()),
      tween: Tween(begin: endTime.difference(DateTime.now()), end: Duration.zero),
      onEnd: () {
        // Handle end of auction
      },
      builder: (BuildContext context, Duration value, Widget? child) {
        final days = value.inDays;
        final hours = value.inHours % 24;
        final minutes = value.inMinutes % 60;
        final seconds = value.inSeconds % 60;
        return Text('$days days $hours hours $minutes minutes $seconds seconds remaining');
      },
    );
  }
}
