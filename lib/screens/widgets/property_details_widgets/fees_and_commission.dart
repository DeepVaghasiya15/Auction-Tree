import 'package:flutter/material.dart';

class FeesCommission extends StatelessWidget {

  final String title4;
  final String subtitleFC;
  final String subtitle2FC;
  final String subtitle3FC;
  final String subtitle4FC;
  final String trailingFC;
  final String trailing2FC;
  final String trailing3FC;
  final String trailing4FC;
  const FeesCommission({super.key, required this.title4, required this.subtitleFC, required this.subtitle2FC, required this.subtitle3FC, required this.subtitle4FC, required this.trailingFC, required this.trailing2FC, required this.trailing3FC, required this.trailing4FC});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Column(
          children: [
            _buildListTile(
              context,
              title: "Buyer's Premium",
              subtitle: subtitleFC,
              trailing: "Not Applicable",
              icon: Icons.account_balance_wallet,
            ),
            _buildListTile(
              context,
              title: "Broker Co-op",
              subtitle: subtitle2FC,
              trailing: "3% Available",
              icon: Icons.handshake,
            ),
            _buildListTile(
              context,
              title: "Closing Cost sharing with buyer",
              subtitle: subtitle3FC,
              trailing: "2% Available",
              icon: Icons.attach_money,
            ),
            _buildListTile(
              context,
              title: title4,
              subtitle: subtitle4FC,
              trailing: "Yes",
              icon: Icons.lock,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, {
    required String title,
    required String subtitle,
    required String trailing,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: ListTile(
        leading: Icon(icon,color: Color(0xFFCA996E),),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          trailing,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
