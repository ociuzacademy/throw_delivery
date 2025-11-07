// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/home_module/widgets/auction_list_widget.dart';
import 'package:throw_delivery/modules/home_module/widgets/wallet_widget.dart';
import 'package:throw_delivery/modules/home_module/widgets/delivery_list_widget.dart';
import 'package:throw_delivery/modules/home_module/widgets/nav_item.dart';
import 'package:throw_delivery/modules/home_module/widgets/profile_widget.dart';

// Import other tab pages (you'll need to create these)

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static route() => MaterialPageRoute(builder: (_) => HomePage());
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _animationController;
  int _currentIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    // Initialize pages
    _initializePages();
  }

  void _initializePages() {
    _pages.addAll([
      AuctionListWidget(),
      const DeliveryListWidget(),
      const WalletWidget(),
      const ProfileWidget(),
    ]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final _ = const Color(0xFFEF4444);

    // Colors for light and dark mode
    final primaryColor = const Color(0xFF00BFFF);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textSecondaryColor = isDark
        ? Colors.grey[400]!
        : const Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF121212)
          : const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Throw'),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                isActive: _currentIndex == 0,
                icon: Icons.home,
                label: 'Home',
                activeColor: primaryColor,
                textColor: _currentIndex == 0
                    ? primaryColor
                    : textSecondaryColor,
                onTap: () => _onTabTapped(0),
              ),
              NavItem(
                isActive: _currentIndex == 1,
                icon: Icons.list_alt,
                label: 'Delivery',
                activeColor: primaryColor,
                textColor: _currentIndex == 1
                    ? primaryColor
                    : textSecondaryColor,
                onTap: () => _onTabTapped(1),
              ),
              NavItem(
                isActive: _currentIndex == 2,
                icon: Icons.wallet,
                label: 'Wallet',
                activeColor: primaryColor,
                textColor: _currentIndex == 2
                    ? primaryColor
                    : textSecondaryColor,
                onTap: () => _onTabTapped(2),
              ),
              NavItem(
                isActive: _currentIndex == 3,
                icon: Icons.person_outline,
                label: 'Profile',
                activeColor: primaryColor,
                textColor: _currentIndex == 3
                    ? primaryColor
                    : textSecondaryColor,
                onTap: () => _onTabTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
