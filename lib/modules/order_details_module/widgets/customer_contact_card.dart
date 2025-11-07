import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class CustomerContactCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;

  const CustomerContactCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsiveSizes.cardPadding),
      decoration: BoxDecoration(
        color: colorScheme.secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Contact',
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.bodyFontSize,
              fontWeight: FontWeight.w700,
              color: colorScheme.textPrimaryColor,
            ),
          ),
          SizedBox(height: responsiveSizes.mediumSpacing),
          Row(
            children: [
              Container(
                width: responsiveSizes.avatarSize,
                height: responsiveSizes.avatarSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    responsiveSizes.avatarSize / 2,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAFxBQkpEEpN9I8CgxSiXCR9i6y4gjCekZtmkACw4MuL37RWVNwcMSDEOdZadD9qtt5ITTPswR0dX0hbPbAOGaSDUnFIfNdX9dr5k0d5i36fjSl3acnlwWd7ao_B4ikVqWQ3FnB6ADjdDB69DRH2LPpz9YdoK21xNsGX1YIfnwJxIFf1xQI6ha06LXpYnWr8o84J-hHepGqCsTyYY96CJDadRrw3L9-y39NlcI2q5laYPiVjeuyhdD9E2aCCQj4u126vm50bKc7flLZ',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: responsiveSizes.mediumSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Priya Sharma',
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: responsiveSizes.smallSpacing),
                    Text(
                      '+91 98765 43210',
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.smallFontSize,
                        color: colorScheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
