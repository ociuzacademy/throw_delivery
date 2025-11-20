// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/document_upload_module/utils/document_upload_helper.dart';
import 'package:throw_delivery/modules/document_upload_module/widgets/upload_section.dart';

class DocumentUploadPage extends StatefulWidget {
  const DocumentUploadPage({super.key});

  @override
  State<DocumentUploadPage> createState() => _DocumentUploadPageState();

  static MaterialPageRoute route() => MaterialPageRoute(builder: (_) => DocumentUploadPage());
}

class _DocumentUploadPageState extends State<DocumentUploadPage> {
  late final DocumentUploadHelper _documentUploadHelper;
  final ValueNotifier<File?> _frontLicenseImage = ValueNotifier<File?>(null);
  final ValueNotifier<File?> _backLicenseImage = ValueNotifier<File?>(null);

  @override
  void initState() {
    super.initState();
    _documentUploadHelper = DocumentUploadHelper(
      context: context,
      frontLicenseImage: _frontLicenseImage,
      backLicenseImage: _backLicenseImage,
    );
  }

  @override
  void dispose() {
    _frontLicenseImage.dispose();
    _backLicenseImage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    // Calculate responsive values
    final contentPadding = DocumentUploadHelper.getContentPadding(screenWidth);
    final titleFontSize = DocumentUploadHelper.getTitleFontSize(screenWidth);
    final descriptionFontSize = DocumentUploadHelper.getDescriptionFontSize(
      screenWidth,
    );
    final sectionSpacing = DocumentUploadHelper.getSectionSpacing(screenWidth);
    final buttonFontSize = DocumentUploadHelper.getButtonFontSize(screenWidth);

    return Scaffold(
      backgroundColor: isDark ? Color(0xFF0F1C23) : Color(0xFFF5F7F8),
      appBar: AppBar(
        title: Text(
          'Upload Documents',
          style: GoogleFonts.inter(
            fontSize: screenWidth < 600 ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.grey[900],
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: contentPadding,
                  vertical: contentPadding,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: screenSize.height - 200,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Description
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upload your License',
                            style: GoogleFonts.inter(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.grey[900],
                            ),
                          ),
                          SizedBox(height: screenWidth < 600 ? 6 : 8),
                          Text(
                            'Please upload clear images of your driver\'s license to verify your identity and eligibility to deliver.',
                            style: GoogleFonts.inter(
                              fontSize: descriptionFontSize,
                              color: isDark
                                  ? Colors.grey[300]
                                  : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: sectionSpacing),

                      // Upload Sections
                      Column(
                        children: [
                          ValueListenableBuilder<File?>(
                            valueListenable: _frontLicenseImage,
                            builder: (context, frontImage, child) {
                              return UploadSection(
                                title: 'Driver\'s License',
                                subtitle: 'Front',
                                defaultImageUrl:
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAtoezz3JxYttShotBTiEGmzBoGyKcZZQqAVHT1WBL0AAjUeJylV237Mnf8scFvu0MVc49UhhWs7DOWYvDbF8UQ4ia_JMrNSwudLJ4uszvn2xg380JoIbKX-xozMTquR5ftkAga3gUFWLOwgokJSnmSfDpalKVqKB3UczvQbLp-TPpsGIR4j3PsofL21vo-adHdaLmbszmOg3Z5VEttMYlvGAdUj0Lj7eL4JVnzqwVFojpkb3i7NwW8VuwsRkrxnKesXTAM_fWArACc',
                                pickedImage: frontImage,
                                onUploadPressed: () => _documentUploadHelper
                                    .pickImage(_frontLicenseImage),
                                screenWidth: screenWidth,
                              );
                            },
                          ),
                          SizedBox(height: screenWidth < 600 ? 12 : 16),
                          ValueListenableBuilder<File?>(
                            valueListenable: _backLicenseImage,
                            builder: (context, backImage, child) {
                              return UploadSection(
                                title: 'Driver\'s License',
                                subtitle: 'Back',
                                defaultImageUrl:
                                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAxIzbO1XiKyjHm1b1s6MFiXIL1sEPRTuX9JrXbOgVQZxb8QH76Ym-B2ZuiVIeCRo0gCFa_i7Bvkzu7t6AKj8LDRujoFWSjAGBmREt9Aj0p7yzIQgNmcnxSe2SbPZEiyrh-19ft6zSm1eyTmOtBr0M-A7PX4WqpTeC9PkYN2U8eZWRzDRhPDyBB4zcBDOLOW5yXDGP2jSJR2NUGfj5qW3JW3_X0laCeKPp6TP23vSaiXu1GM36fWhRUnW-f0xMa1KFUklwl5w7iBpO9',
                                pickedImage: backImage,
                                onUploadPressed: () => _documentUploadHelper
                                    .pickImage(_backLicenseImage),
                                screenWidth: screenWidth,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(contentPadding),
              decoration: BoxDecoration(
                color: isDark ? Color(0xFF0F1C23) : Color(0xFFF5F7F8),
                border: Border(
                  top: BorderSide(
                    color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  ),
                ),
              ),
              child: ElevatedButton(
                onPressed: _documentUploadHelper.submitDocuments,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00AAFF),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: Color(0xFF00AAFF).withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      screenWidth < 600 ? 10 : 12,
                    ),
                  ),
                  minimumSize: Size(
                    double.infinity,
                    screenWidth < 600 ? 44 : 48,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth < 600 ? 12 : 14,
                  ),
                ),
                child: Text(
                  'Submit Documents',
                  style: GoogleFonts.inter(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
