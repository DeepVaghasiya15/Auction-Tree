import 'package:flutter/material.dart';

class FeesCommission extends StatelessWidget {
  const FeesCommission({super.key});

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
              subtitle: "Winner will not be charged fee for this property.",
              trailing: "Not Applicable",
              icon: Icons.account_balance_wallet,
            ),
            _buildListTile(
              context,
              title: "Broker Co-op",
              subtitle: "As per the terms of the Listing Agreement, the Seller will provide a commission/fee to any appropriately registered Broker whose client not only emerges as the successful Buyer at the Auction but also completes the purchase of the Property.",
              trailing: "3% Available",
              icon: Icons.handshake,
            ),
            _buildListTile(
              context,
              title: "Closing Cost sharing with buyer",
              subtitle: "Indicates that the seller is willing to share 2% of the closing costs with the buyer.",
              trailing: "2% Available",
              icon: Icons.attach_money,
            ),
            _buildListTile(
              context,
              title: "Interior Access",
              subtitle: "Please contact +1 832 679 2176 for details or Click Here to request a tour.",
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
