import 'package:midad/components/web/web.dart';
import 'package:midad/core/keys/keys.dart';
import 'package:midad/core/router/app_routes.dart';
import 'package:midad/features/auth/pages/login_screen.dart';
import 'package:midad/features/auth/pages/password_reset_screen.dart';
import 'package:midad/features/auth/pages/register_screen.dart';
import 'package:midad/features/help/pages/help_screen.dart';
import 'package:midad/features/home/pages/home.dart';
import 'package:midad/features/journal/pages/journal_details_page.dart';
import 'package:midad/features/journal/pages/journal_page.dart';
import 'package:midad/features/journal/widgets/pdf_viewer_page.dart';
import 'package:midad/features/notification/notification_screen.dart';
import 'package:midad/features/onboarding/onboarding_screen.dart';
import 'package:midad/features/profile/pages/change_password_screen.dart';
import 'package:midad/features/profile/pages/profile_screen.dart';
import 'package:midad/features/projects/pages/all_project_page.dart';
import 'package:midad/features/root/root_screen.dart';
import 'package:midad/features/search/search_screen.dart';
import 'package:midad/features/settings/pages/settings_screen.dart';
import 'package:midad/features/statics/about.dart';
import 'package:midad/features/statics/privacy_policy.dart';
import 'package:midad/features/statics/terms_conditions.dart';

import '../../features/article/pages/article_details.dart';
import '../../features/article/pages/articles_screen.dart';
import '../../features/category/pages/category_details_screen.dart';
import '../../features/category/pages/category_screen.dart';
import '../../features/news/pages/latest_news.dart';
import '../../features/news/pages/news_details.dart';
import '../../features/tag/pages/tag_details_screen.dart';
import '../../features/tag/pages/tags_screen.dart';
import '../../features/type/pages/type_details_screen.dart';
import '../../features/type/pages/types_screen.dart';
import '../../features/video_gallery/pages/video_gallery.dart';
import '../../features/video_gallery/pages/youtube_player_screen.dart';

List<RouteBase> routes = <RouteBase>[
  GoRoute(
    path: AppRoutes.onboarding.path,
    name: AppRoutes.onboarding.name,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: AppRoutes.about.path,
    name: AppRoutes.about.name,
    builder: (_, __) => const AboutScreen(),
  ),
  GoRoute(
    path: AppRoutes.privacyPolicy.path,
    name: AppRoutes.privacyPolicy.name,
    builder: (_, __) => const PrivacyPolicyScreen(),
  ),
  GoRoute(
    path: AppRoutes.termsConditions.path,
    name: AppRoutes.termsConditions.name,
    builder: (_, __) => const TermsConditionsScreen(),
  ),
  GoRoute(
    path: AppRoutes.register.path,
    name: AppRoutes.register.name,
    builder: (_, __) => const RegisterScreen(),
  ),
  GoRoute(
    path: AppRoutes.login.path,
    name: AppRoutes.login.name,
    builder: (_, __) => const LoginScreen(),
    routes: [
      GoRoute(
        path: AppRoutes.resetPassword.path,
        name: AppRoutes.resetPassword.name,
        builder: (_, __) => const PasswordResetScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.resetPasswordDone.path,
      //   name: AppRoutes.resetPasswordDone.name,
      //   builder: (_, __) => const PasswordResetDoneScreen(),
      // ),
    ],
  ),
  GoRoute(
    path: AppRoutes.settings.path,
    name: AppRoutes.settings.name,
    builder: (_, __) => const SettingsScreen(),
  ),
  GoRoute(
    path: AppRoutes.changePassword.path,
    name: AppRoutes.changePassword.name,
    builder: (_, __) => const ChangePasswordScreen(),
  ),
  GoRoute(
    path: AppRoutes.help.path,
    name: AppRoutes.help.name,
    builder: (_, __) => const HelpScreen(),
  ),
  // GoRoute(
  //   path: AppRoutes.web.path,
  //   name: AppRoutes.web.name,
  //   builder: (_, __) => const WebViewScreen(),
  // ),
  GoRoute(
    path: AppRoutes.web.path,
    name: AppRoutes.web.name,
    builder: (context, state) {
      final url = state.uri.queryParameters['url'] ?? '';
      return WebViewScreen(
        url: url,
      );
    },
  ),

  ShellRoute(
    restorationScopeId: 'root',
    navigatorKey: shellNavigatorKey,
    builder: (context, state, child) {
      return RootScreen(child: child);
    },
    routes: [
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.journal.name,
        path: AppRoutes.journal.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: JournalPage(),
          );
        },
      ),
      // GoRoute(
      //   name: AppRoutes.category.name,
      //   path: AppRoutes.category.path,
      //   parentNavigatorKey: shellNavigatorKey,
      //   pageBuilder: (context, state) {
      //     return const NoTransitionPage(
      //       child: CategoryScreen(),
      //     );
      //   },
      // ),
      GoRoute(
        name: AppRoutes.search.name,
        path: AppRoutes.search.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          // final query = state.uri.queryParameters['query'];

          return const NoTransitionPage(
            child: SearchScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.notifications.name,
        path: AppRoutes.notifications.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: NotificationScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.profile.name,
        path: AppRoutes.profile.path,
        parentNavigatorKey: shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: ProfileScreen(),
          );
        },
        routes: [
          // GoRoute(
          //   path: AppRoutes.updateProfile.path,
          //   name: AppRoutes.updateProfile.name,
          //   builder: (_, __) => const UpdateProfileScreen(),
          // ),
        ],
      ),
    ],
  ),
  GoRoute(
    path: AppRoutes.youtubePlayer.path,
    name: AppRoutes.youtubePlayer.name,
    builder: (context, state) {
      final videoId = state.uri.queryParameters['id']!;
      return YoutubePlayerScreen(videoId: videoId);
    },
  ),
  GoRoute(
    path: AppRoutes.articleDetails.path,
    name: AppRoutes.articleDetails.name,
    builder: (context, state) {
      final articleId = int.parse(state.pathParameters['id']!);
      return ArticleDetailsScreen(articleId: articleId);
    },
  ),
  GoRoute(
    path: AppRoutes.articles.path,
    name: AppRoutes.articles.name,
    builder: (_, __) => const ArticlesScreen(),
  ),
  GoRoute(
    path: AppRoutes.latestNews.path,
    name: AppRoutes.latestNews.name,
    builder: (_, __) => const LatestNewsScreen(),
  ),
  GoRoute(
    path: AppRoutes.newsDetails.path,
    name: AppRoutes.newsDetails.name,
    builder: (context, state) {
      final articleId = int.parse(state.pathParameters['id']!);
      return NewsDetailsScreen(articleId: articleId);
    },
  ),
  GoRoute(
    path: AppRoutes.videoGallery.path,
    name: AppRoutes.videoGallery.name,
    builder: (_, __) => const VideoGalleryScreen(),
  ),
  GoRoute(
    path: AppRoutes.journalDetails.path,
    name: AppRoutes.journalDetails.name,
    builder: (context, state) {
      final journalId = state.pathParameters['journalId'] ?? '';
      return JournalDetailsPage(journalId: journalId);
    },
  ),
  GoRoute(
    name: AppRoutes.pdfViewer.name,
    path: AppRoutes.pdfViewer.path,
    builder: (context, state) {
      final pdfUrl = state.pathParameters['pdfUrl'] ?? '';

      return PDFViewerPage(pdfUrl: pdfUrl);
    },
  ),
  GoRoute(
    name: AppRoutes.category.name,
    path: AppRoutes.category.path,
    builder: (_, __) => const CategoryScreen(),
  ),
  GoRoute(
    name: AppRoutes.categoryDetails.name,
    path: AppRoutes.categoryDetails.path,
    builder: (context, state) {
      final categoryId = int.parse(state.uri.queryParameters['categoryId']!);
      final categoryName = state.uri.queryParameters['categoryName']!;
      return CategoryDetailsScreen(
        categoryId: categoryId,
        categoryName: categoryName,
      );
    },
  ),
  GoRoute(
    name: AppRoutes.types.name,
    path: AppRoutes.types.path,
    builder: (_, __) => const TypesScreen(),
  ),
  GoRoute(
    name: AppRoutes.typeDetails.name,
    path: AppRoutes.typeDetails.path,
    builder: (context, state) {
      final typeId = int.parse(state.uri.queryParameters['typeId']!);
      final typeName = state.uri.queryParameters['typeName']!;
      return TypeDetailsScreen(
        typeId: typeId,
        typeName: typeName,
      );
    },
  ),
  GoRoute(
    name: AppRoutes.tags.name,
    path: AppRoutes.tags.path,
    builder: (_, __) => const TagsScreen(),
  ),
  GoRoute(
    name: AppRoutes.allProjects.name,
    path: AppRoutes.allProjects.path,
    builder: (_, __) => const AllProjectsPage(),
  ),
  GoRoute(
    name: AppRoutes.tagDetails.name,
    path: AppRoutes.tagDetails.path,
    builder: (context, state) {
      final tagId = int.parse(state.uri.queryParameters['tagId']!);
      final tagName = state.uri.queryParameters['tagName']!;
      return TagDetailsScreen(
        tagId: tagId,
        tagName: tagName,
      );
    },
  ),
];
