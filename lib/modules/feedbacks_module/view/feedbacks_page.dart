import 'package:flutter/material.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/average_rating_card_widget.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/feedback_header_widget.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/review_tem_widget.dart';

class FeedbacksPage extends StatelessWidget {
  const FeedbacksPage({super.key});

  static route() => MaterialPageRoute(builder: (_) => FeedbacksPage());

  @override
  Widget build(BuildContext context) {
    final reviews = [
      ReviewItem(
        id: '1',
        customerName: 'Jane Doe',
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBVE9tWhvdlCzrIpu08D6Fsosay4bOMZMU1kV52BrkZwaD1fiuaZwcGvdCUtmiyoYwZU5JqnA8quuGt_yxh8egz7N3QCXPWH7l7Zd6u-teDAgyRtBkeE0-tKP6CcIKlasDeTlXBjC3qCsMh_f56BQQKe017Gdv29vjcEyMvVTKvfy-eSd3J1wxWEmrlDMT3dr29z6_ycBSSle-ha0LfUjhWnE8F95mPlWILDa1kTckYwLMHV-lSyS4liHNQqLBizMrtiTRusK-kiQDt',
        rating: 5,
        comment:
            'Excellent service! The delivery was super fast and the agent was very polite. Highly recommended.',
        timeAgo: '2 days ago',
      ),
      ReviewItem(
        id: '2',
        customerName: 'John Smith',
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDw8l13KzNnK4Ur2ARHSspaWC_rVOB7Xv9V4b94Mu6kQQ16v3l8KH29eNWt3TERe0ZXcD1h-cGyCfXUPc49Lre2JXPIjlTXaQeWY3RxiOgAyWv6eiD3CjkF2lzn6juxxlLnEMI0h_h8RHxcca3OUWVWUuiZwri157yvznfUG2EFBSlWmqowFXIdrvwZqK69xIayujhvQ1NTe3YGBquVOk8R7wzLNjxt4JPW7MDcQFQkpD8jKmwITsOwaM5vsUXj2hRxqg0h1XeonLxb',
        rating: 4,
        comment:
            'Good communication and the package arrived safely. The delivery took a bit longer than expected.',
        timeAgo: '5 days ago',
      ),
      ReviewItem(
        id: '3',
        customerName: 'Sarah Connor',
        avatarUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuA0TQvlLByLfULGOokmMCJc5gHtkKmShI3Ii7Z-EtBQhkuLDsAQlohhAmjqWMrjpvh9n1t-m3m6kOCB1jX2xx3CVu37lKdQbY2eI3SKxSv3WlAvFFVmW_YD2RcB1Uge_Xxyigj_AVOQqycQcnssZMw8d87S6dXPxmT5UV81qrIJ85EgofM1oJKwohuTm1RQEe_zOxI1V5_-PLJjIKCIN4w3v8qI0yhqPmxDFxakcbmaiNN-2PNVjcU_nLD-AHcvJE7KK_tivOCDnvBl',
        rating: 5,
        comment:
            'Perfect experience. The agent was very professional and friendly. Would definitely use this service again!',
        timeAgo: '1 week ago',
      ),
    ];

    return Scaffold(
      appBar: FeedbackHeader(onBackPressed: () => Navigator.of(context).pop()),
      body: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AverageRatingCard(rating: 4.8, reviewCount: 125),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: reviews.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return ReviewItemWidget(review: reviews[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
