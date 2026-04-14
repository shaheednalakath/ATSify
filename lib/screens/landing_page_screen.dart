import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _HeroSection(),
            const _FeaturesSection(),
            const _HowItWorksSection(),
            const _FinalCTASection(),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade50,
            Colors.white,
            Colors.blue.shade50.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'ATSify',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
              letterSpacing: 1.2,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),
          const SizedBox(height: 16),
          Text(
            'Build ATS-Ready Resumes Instantly',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.grey.shade900,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 800.ms).scale(begin: const Offset(0.9, 0.9)),
          const SizedBox(height: 20),
          Text(
            'Your gateway to professional resumes that actually get read by recruiters.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w400,
            ),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/templates'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
            ),
            child: const Text('Get Started', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
           .shimmer(delay: 2.seconds, duration: 1500.ms, color: Colors.blue.shade300)
           .animate().fadeIn(delay: 600.ms).scale(begin: const Offset(0.8, 0.8)),
          const SizedBox(height: 60),
          SizedBox(
            height: 300,
            child: Lottie.network(
              'https://lottie.host/78622c7f-9469-450f-9f79-99f6979203c2/R1j8A6mHjS.json',
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.description, size: 100, color: Colors.blue),
            ),
          ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          Text(
            'Why Choose ATSify?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ).animate().fadeIn(),
          const SizedBox(height: 48),
          const Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _FeatureCard(
                icon: Icons.auto_awesome,
                title: 'Create Resume',
                desc: 'Simple interactive forms to build your profile in minutes.',
                color: Colors.blue,
              ),
              _FeatureCard(
                icon: Icons.check_circle_outline,
                title: 'ATS Optimized',
                desc: 'Templates designed to pass through tracking systems.',
                color: Colors.green,
              ),
              _FeatureCard(
                icon: Icons.dashboard_customize,
                title: 'Multiple Templates',
                desc: 'Choose from Modern, Basic, or Fresher designs.',
                color: Colors.purple,
              ),
              _FeatureCard(
                icon: Icons.file_download,
                title: 'Download PDF/DOCX',
                desc: 'Export your resume in high-quality formats instantly.',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600, height: 1.4),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.1);
  }
}

class _HowItWorksSection extends StatelessWidget {
  const _HowItWorksSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      child: Column(
        children: [
          const Text(
            'How It Works',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 48),
          const Column(
            children: [
              _StepItem(
                number: '1',
                title: 'Choose Template',
                desc: 'Pick a layout that fits your career stage.',
              ),
              _StepItem(
                number: '2',
                title: 'Fill Details',
                desc: 'Enter your experience, education, and skills.',
              ),
              _StepItem(
                number: '3',
                title: 'Download Resume',
                desc: 'Get your professional resume in PDF or Word format.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String number;
  final String title;
  final String desc;

  const _StepItem({
    required this.number,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ).animate().scale(delay: 300.ms),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                desc,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ],
          ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.05),
        ],
      ),
    );
  }
}

class _FinalCTASection extends StatelessWidget {
  const _FinalCTASection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          Text(
            'Start Building Your Resume Now',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true))
           .scale(duration: 2.seconds, begin: const Offset(1, 1), end: const Offset(1.05, 1.05)),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/templates'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 22),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 8,
            ),
            child: const Text('Get Started Now', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ).animate().fadeIn().scale(),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Text(
        '© 2026 ATSify. Professional Resume Builder.',
        style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
      ),
    );
  }
}
