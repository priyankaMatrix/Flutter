import 'package:flutter/material.dart';
import 'package:test1/subscriptionlist_screen.dart';
import 'package:test1/ticket_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _page = [SubscriptionListScreen(),TicketScreen()];
  var _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
       //   https://www.youtube.com/watch?v=elLkVWt7gRM
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),
        label: 'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.airplane_ticket),
              label: 'Ticket'),
        ],
      ),
    );
  }
}
